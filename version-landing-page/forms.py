from wtforms import Form,TextAreaField


class PostForm(Form):
	text = TextAreaField('Text')
