from main import Comment,db,Second_comment
from sqlalchemy.orm.session import make_transient




def get2(post='', id=''):
	if len(id)>=1:
		first=Comment.query.filter(Comment.id==id).first()
	elif len(post)>=1:
		first=Comment.query.filter(Comment.text==Comment).first()
	else:
		return False
	print (first.Second_comments)
	test1=[]
	for i in first.Second_comments:
		test1.append(i.date)
	test1.sort()
	new_arr=[]
	for j in test1:
		name=Second_comment.query.filter(Second_comment.date==j).first()
		new_arr.append(name)
	return new_arr

def delete2(post='', id=''):
	if len(id)>=1:
		first=Comment.query.filter(Comment.id==id).first()
	elif len(post)>=1:
		first=Comment.query.filter(Comment.text==post).first()
	else:
		return False
	for i in first.Second_comments:
		db.session.delete(i)
		db.session.commit()
def update2(arr,post='', id=''):
	if len(id)>=1:
		first=Comment.query.filter(Comment.id==id).first()
	elif len(post)>=1:
		first=Comment.query.filter(Comment.text==post).first()
	else:
		return False
	for i in arr:
		make_transient(i)
		first.Second_comments.append(i)
	db.session.add(first)
	db.session.commit()

def ups2(post='', id=''):
	# Ввод имя тега или id.
	# сортирует теги
	if len(str(id))>=1:
		id=str(id)
		print ( 'User use ID, id = {}'.format(id) )
		up = get2(id=id)
		delete2(id=id)
		update2(up,id=id)
		print ('ALL DONE')
	elif len(str(post))>=1:
		post=str(post)
		print ( 'User use find to text, post = {}'.format(post) )
		up = get2(post=post)
		delete2(post=post)
		update2(up,post=post)
		print ('ALL DONE')
	else:
		print ('Error!')
		return False


def start_sort_LW(Comment):
	all = Comment.query.all()
	for a in all:
		ups2(id=str(a.id))

