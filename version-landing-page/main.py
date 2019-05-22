from flask import Flask, render_template, request, jsonify, redirect,url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from sqlalchemy import func
from flask_migrate import Migrate, MigrateCommand 
from flask_script import Manager


from forms import  PostForm
from config import Configuration
from sorted import *

# екземпляр класса фласк и база данных
app = Flask(__name__)
app.config.from_object(Configuration)
db = SQLAlchemy(app)



# работа с db, миграции, апдейты... etc...
migrate = Migrate(app, db)
manager = Manager(app)
manager.add_command('db', MigrateCommand) 

# таблица отношений коментариев-коментариев коментария
comment_to_second = db.Table('comment_to_second',
	db.Column('comment_id', db.Integer, db.ForeignKey('comment.id')),
	db.Column('second_comment_id',db.Integer, db.ForeignKey('second_comment.id'))
	)	

# Таблица отношений постов-коментариев
post_comments = db.Table('post_comments', 
	db.Column('post_id', db.Integer, db.ForeignKey('post.id')),
	db.Column('comment_id',db.Integer, db.ForeignKey('comment.id'))
	)

# Класс коментариев коментарев (LW)
class Second_comment(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	text = db.Column(db.String(100))
	date = db.Column(db.DateTime, default=func.now())

	def __init__(self,text):
		self.text = text

	def __repr__(self):
		return 'Tag id = {}, text = {} date = {}'.format(self.id,self.text,self.date)

# Класс коментариев (LL)
class Comment(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	text = db.Column(db.String(100))
	date = db.Column(db.DateTime, default=func.now())
	__table_args__ = {'extend_existing': True} 

	def __init__(self,text):
		self.text = text

	Second_comments = db.relationship('Second_comment', secondary=comment_to_second, backref=db.backref('comments', lazy='dynamic') ) 

	def __repr__(self):
		return 'Tag id = {}, text = {}'.format(self.id,self.text)

# Класс постов
class Post(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	text = db.Column(db.Text)
	date = db.Column(db.DateTime, default=func.now())
	__table_args__ = {'extend_existing': True} 

	def __init__(self,text):
		self.text = text

	comments = db.relationship('Comment', secondary=post_comments, backref=db.backref('posts', lazy='dynamic') )

	def __repr__(self):
		return 'id = {}, text = {}'.format(self.id,self.text)


# Главная, и добавляет пост
@app.route('/', methods=['GET', 'POST'] )
def index():

	if request.method == 'POST':
		
		try:
			text =request.form['text']
		except:
			text = ''
		if len(text)>=1:
			text = request.form['text']

			try:
				post = Post(text)
				db.session.add(post)
				db.session.commit()
			except:
				print ('error in commit. -- #0')

	form = PostForm()
	posts = test222(Post)

	return render_template('index.html', posts = posts,form = form)


# Редактирует пост
@app.route('/create',methods=['POST'])
def create():
	text = request.form['name']
	id = request.form['id']
	post = Post.query.filter(Post.id == id ).first()
	post.text = text
	db.session.commit()
	return jsonify({'text' : text})


# Удаляет пост
@app.route("/delete", methods=['POST'])
def delete():
	id = request.form['id']
	post = Post.query.filter(Post.id == id).first()
	for comment in post.comments:
		db.session.delete(comment)
		db.session.commit()
	db.session.delete(post)	
	db.session.commit()
	return jsonify({'text' : id})

# добавляет коментарий LL
@app.route('/add_comment2', methods=['POST'] )
def add_comment2():
	id = request.form['post_id']
	comment = request.form['input_field']
	if len(comment)>=1:
		post = Post.query.filter(Post.id==id).first()
		com = Comment(comment)
		db.session.add(com)
		db.session.commit()
		post.comments.append(com)
		db.session.add(post)
		db.session.commit()
	start_sort_LL(Post) #функция из файла up_data.py
	return redirect(url_for('index'))


# Удаляет коментарий LL
@app.route("/delete_comment", methods=['POST'])
def delete_comment():
	id = request.form['id']
	comment = Comment.query.filter(Comment.id == id).first()
	for sc in comment.Second_comments:
		db.session.delete(sc)
		db.session.commit()
	db.session.delete(comment)
	db.session.commit()
	return redirect(url_for('index'))

# Редактирует кометарий LL
@app.route('/edit_post_comment',methods=['POST'])
def edit_post_comment():
	text = request.form['name']
	id = request.form['id']
	comment = Comment.query.filter(Comment.id == id ).first()
	comment.text = text
	db.session.commit()

	return jsonify({'text' : text})

# Добавляет коментарий LW
@app.route('/add_comment3', methods=['POST'] )
def add_comment3():
	id = request.form['post_id']
	comment = request.form['input_field']
	if len(comment)>=1:
		post = Comment.query.filter(Comment.id==id).first()
		com = Second_comment(comment)
		db.session.add(com)
		db.session.commit()
		post.Second_comments.append(com)
		db.session.add(post)
		db.session.commit()
	start_sort_LW(Comment)
	return redirect(url_for('index'))


	
# Редактирует кометнтарий коментария (LW)
@app.route('/edit_commentLW', methods=['POST'] )
def edit_commentLW():
	text = request.form['name']
	id = request.form['id']
	comment = Second_comment.query.filter(Second_comment.id == id ).first()
	comment.text = text
	db.session.commit()
	print ('done')

	return jsonify({'text' : text})


# Удаляет коментарий коментария
@app.route("/deleteLW", methods=['POST'])
def deleteLW():
	id = request.form['id']
	post = Second_comment.query.filter(Second_comment.id == id).first()
	db.session.delete(post)	
	db.session.commit()
	return jsonify({'text' : id})

# Дает порядок постам. 
def test222(Post):
	all=Post.query.all()
	new_arr=[]
	for i in all:
		new_arr.append(i.date)
	new_arr.sort()
	new_arr.reverse()
	new_arr_arr=[]
	for j in new_arr:
		new_arr_arr.append(Post.query.filter(Post.date==j).first())
	return new_arr_arr

# Проверка пользователя в базе данных и установка его постов
@app.route("/login", methods=['POST'])
def login():
	print (request.form)
	if len(request.form)>0:
		name = request.form['name']
		id = request.form['id']
		
		return redirect(url_for('index'))
	return redirect(url_for('index'))


# START THIS APP
if __name__ == '__main__':
    app.run()












