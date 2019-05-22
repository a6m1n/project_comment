# from main import Post,Comment,db
from sqlalchemy.orm.session import make_transient




def get(post='', id=''):
	if len(id)>=1:
		first=Post.query.filter(Post.id==id).first()
	elif len(post)>=1:
		first=Post.query.filter(Post.text==post).first()
	else:
		return False
	test1=[]
	for i in first.comments:
		test1.append(i.date)
	test1.sort()
	new_arr=[]
	for j in test1:
		name=Comment.query.filter(Comment.date==j).first()
		new_arr.append(name)
	return new_arr

def delete(post='', id=''):
	if len(id)>=1:
		first=Post.query.filter(Post.id==id).first()
	elif len(post)>=1:
		first=Post.query.filter(Post.text==post).first()
	else:
		return False
	for i in first.comments:
		db.session.delete(i)
		db.session.commit()
def update(arr,post='', id=''):
	if len(id)>=1:
		first=Post.query.filter(Post.id==id).first()
	elif len(post)>=1:
		first=Post.query.filter(Post.text==post).first()
	else:
		return False
	for i in arr:
		make_transient(i)
		first.comments.append(i)
	db.session.add(first)
	db.session.commit()

def ups(post='', id=''):
	# Ввод имя тега или id.
	# сортирует теги
	if len(str(id))>=1:
		print ( 'User use ID, id = {}'.format(id) )
		up = get(id=id)
		delete(id=id)
		update(up,id=id)
		print ('ALL DONE')
	elif len(str(post))>=1:
		print ( 'User use find to text, post = {}'.format(post) )
		up = get(post=post)
		delete(post=post)
		update(up,post=post)
		print ('ALL DONE')
	else:
		print ('Error!')
		return False


def start_sort_LL(Post):
	all = Post.query.all()
	for a in all:
		ups(id=str(a.id))
