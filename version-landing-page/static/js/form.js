
// *******************************FACEBOOOK *******************************//

// нужно доделать чтоб грузилась 3 секунды и отображалось все.
// setTimeout(ttt, 3000);

// function ttt (){
// 	alert('hey');
// }




  window.fbAsyncInit = function() {
    FB.init({
      appId      : '605401409963508',
      cookie     : true,
      xfbml      : true,
      version    : 'v3.3'
    });

      FB.getLoginStatus(function(response) {
          statusChangeCallback(response);
          if_user_connect(response);
      });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

   function statusChangeCallback(response){
     console.log(response);
     FB.api('/me?fields=name,email',function(response1){
        console.log(response1);
        if_user_connect(response,response1)

      })
   }


  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      FB.api('/me?fields=name,email',function(response){
        console.log(response);
      })
    });
  }

  function logout(){
    FB.logout();
   if_user_connect(false)
  }
// блок проверки авторизирован ли юзер или нет. 
  function if_user_connect(response,response1='False'){
  	var block_input_post = document.getElementById('text');
  	var class_list = [
					'button_post', 'editSomePost','delete','editComentLL',
					'ButtonDelete0Comments0','InputComment','buttonDeleteLW',
					'editComLW','deleteCommentLL','inputLW','comment_LW','addcommentButton'
	]
	
    if (response.status == 'connected'){
     document.getElementById('fbButtonLogin').style.display = 'none';
     document.getElementById('if_true').style.display = 'block';
     document.getElementById('name_user').innerHTML = response1.name;
     document.getElementById('id_user').innerHTML = response1.id;
     block_input_post.removeAttribute('disabled');
     block_input_post.removeAttribute('placeholder');
     for (var i = 0; i < class_list.length; ++i){
			test = document.getElementsByClassName(class_list[i]);
			for (var j =0 ; j<test.length; ++j){
				test[j].style.display='inline';
			}
		}
     $.ajax({
			data : {
				name : response1.name,
				id : response1.id
			},
			type : 'POST',
			url : '/login',
		})
     

    }
    else{
		document.getElementById('fbButtonLogin').style.display = 'block';
		document.getElementById('if_true').style.display = 'none';
		var test;
		for (var i = 0; i < class_list.length; ++i){
			test = document.getElementsByClassName(class_list[i]);
			for (var j =0 ; j<test.length; ++j){
				test[j].style.display='none';
			}
		}


		block_input_post.setAttribute('disabled', 'disabled');
		block_input_post.setAttribute('placeholder', 'Выполните вход для написания нового поста');
    }
  }


















// *******************************FACEBOOOK *******************************//
// // ******************************БЛОКИРОВА ЕСЛИ НЕ АВТОРЕЗИРОВАН*******************************//



// disabled="disabled",placeholder='Выпоните вход' 
// input, textarea
// button if not comment = display none












// 






// *******************************РАЗДАЧА ID*******************************//
$(document).ready(function() {
	

	
	var elements = document.getElementsByClassName('startBlock');
	for (var index = 0; index < elements.length; ++index) {


		elements[index].id = 'div'+index 
		
		var input_form = elements[index].getElementsByClassName('editSomePost');
		input_form[0].id = index;
		
		var textarea_form = elements[index].getElementsByClassName('editSomeText');
		textarea_form[0].id = 'form'+index;
		// редактировать сам пост.
		
		var textFromDb = elements[index].getElementsByClassName('text_in_db');
		textFromDb[0].id = 'textFromDb'+index;

		var dateFromDb = elements[index].getElementsByClassName('date_in_db');
		dateFromDb[0].id = 'date_in_db'+index;

		var idFromDb = elements[index].getElementsByClassName('id_in_db');
		idFromDb[0].id = 'id_in_db'+index;

		var buttonDelete = elements[index].getElementsByClassName('delete');
		buttonDelete[0].id = 'delete'+index;

		var buttonComments = elements[index].getElementsByClassName('commentButton');
		buttonComments[0].id = 'commentButton'+index;
    
		var spanComments = elements[index].getElementsByClassName('spancomments');
		spanComments[0].id = 'spancomments'+index;

		var inputComment = elements[index].getElementsByClassName('InputComment');
		inputComment[0].id = 'InputComment'+index;

		var addcommentButton = elements[index].getElementsByClassName('addcommentButton');
		addcommentButton[0].id = 'addcommentButton'+index;

		// раздача кометариям ID
		var road_to_comments = elements[index].getElementsByClassName('spancomments');
		for (var index2 = 0; index2 < road_to_comments[0].getElementsByClassName('textComments').length; ++index2){ 
			var comment = road_to_comments[0].getElementsByClassName('textComments')[index2];
			comment.id = 'text' +index2+'Comments'+index			
		}

		var deleteCommentLL = elements[index].getElementsByClassName('deleteCommentLL');
		for (var index4 = 0; index4 < deleteCommentLL.length; ++index4){
			deleteCommentLL[index4].id = 'ButtonDelete' +index4+'Comments'+index;
		}

		var editComentLL = elements[index].getElementsByClassName('editComentLL');
		for (var index5=0; index5 < editComentLL.length; ++index5){
			editComentLL[index5].id = 'edit' +index5+'CommentLL'+index;
		}

		var idCommentLL = elements[index].getElementsByClassName('idCommentLL');
		for (var index3 = 0; index3 < idCommentLL.length; ++index3){
			idCommentLL[index3].id = 'id' +index3+'LLComment'+index;
		}

		var textAreaEditLL = elements[index].getElementsByClassName('textAreaEditLL');
		for (var index6 = 0; index6 < textAreaEditLL.length; ++index6){
			textAreaEditLL[index6].id = 'text' +index6+'AreaEditLL'+index;
		}


		var hideForm = elements[index].getElementsByClassName('hideForm');
		for (var index7 = 0; index7 < hideForm.length; ++index7){
			hideForm[index7].id = 'hide' +index7+'Form'+index;
		}
		var commentLW = elements[index].getElementsByClassName('commentLW');
		for (var index8 = 0; index8 < commentLW.length; ++index8){
			commentLW[index8].id = 'hide' +index8+'Form'+index;
		}	
		var levelLW = elements[index].getElementsByClassName('levelLW');
		for (var index9 = 0; index9 < levelLW.length; ++index9){
			levelLW[index9].id = 'level' +index9+'LW'+index;
		}

		var comment_LW = elements[index].getElementsByClassName('comment_LW');
		for (var index11 = 0; index11 < comment_LW.length; ++index11){
			comment_LW[index11].id = 'comment' +index11+'_LW'+index;
		}

		var inputLW = elements[index].getElementsByClassName('inputLW');
		for (var index10= 0; index10< inputLW.length; ++index10){
			inputLW[index10].id = 'input' +index10+'LW'+index;
		}
		var id_in_db_LW = elements[index].getElementsByClassName('id_in_db_LW');
		for (var index12= 0; index12< id_in_db_LW.length; ++index12){
			id_in_db_LW[index12].id = 'id_in_db' +index12+'LW'+index;
		}
	 	var blockLW = elements[index].getElementsByClassName('blockLW');
		for (var index12= 0; index12< blockLW.length; ++index12){
			blockLW[index12].id = 'block' +index12+'LW'+index;
		}
		var buttonDeleteLW = elements[index].getElementsByClassName('buttonDeleteLW');
		for (var index13= 0; index13< buttonDeleteLW.length; ++index13){
			buttonDeleteLW[index13].id = 'buttonDelete' +index13+'LW'+index;
		}
		var blockAllLW = elements[index].getElementsByClassName('blockAllLW');
		for (var index14= 0; index14< blockAllLW.length; ++index14){
			blockAllLW[index14].id = 'blockAll' +index14+'LW'+index;
		}
		
		var textAreaLW = elements[index].getElementsByClassName('textAreaLW');
		for (var index15= 0; index15 < textAreaLW.length; ++index15){
			textAreaLW[index15].id = 'textArea' +index15+'LW'+index;
		}
		var editComLW = elements[index].getElementsByClassName('editComLW');
		for (var index16 = 0; index16 < editComLW.length; ++index16){
			editComLW[index16].id = 'editCom' +index16+'LW'+index;
		}
    };
   
});
// *******************************РАЗДАЧА ID*******************************//
// // ******************************ОБРАБОТКА EDIT/DELETE/SHOW*******************************//
function editPost(test2){
	if (document.getElementById('form'+test2.id).style.display=='none'){
		test2.value = 'Отправить';
		document.getElementById('form'+test2.id).value = document.getElementById('textFromDb'+test2.id).innerHTML.replace(/\s/g, '');
		document.getElementById('form'+test2.id).style.display = 'block';
	}
	else {
		document.getElementById('form'+test2.id).style.display = 'none';
		test2.value = 'Редактировать';
		$.ajax({
			data : {
				name : document.getElementById('form'+test2.id).value,
				id : document.getElementById('id_in_db'+test2.id).innerHTML.replace(/\s/g, '')
			},
			type : 'POST',
			url : '/create'
		})
		.done(function(data) {
			if (data.error) {
				console.log(data);
			}
			else {
				document.getElementById('textFromDb'+test2.id).innerHTML = data.text;
			}
		});

		// event.preventDefault();

	}
}
function test2(test3){
	var num=6;
	var num2=test3.id.length;
	var newstr = test3.id.substring(num,num2);
	$.ajax({
			data : {
				id : document.getElementById('id_in_db'+newstr).innerHTML.replace(/\s/g, '')
			},
			type : 'POST',
			url : '/delete'
		})
		.done(function(data) {
			if (data.error) {
				console.log(data);
			}
			else {
				document.getElementById('div'+newstr).style.display='none';
			}
		});
 

}

function showComments(element){
	var num=13;
	var num2=element.id.length;
	var newstr = element.id.substring(num,num2);
	// console.log(document.getElementById('spancomments'+newstr));

	if (document.getElementById('spancomments'+newstr).style.display=='none'){
		document.getElementById('spancomments'+newstr).style.display='block';
	}
	else {
		document.getElementById('spancomments'+newstr).style.display='none';
	}
	

}
function add_comment(element){
	var num=16;
	var num2=element.id.length;
	var newstr = element.id.substring(num,num2);
	var post_id = document.getElementById('id_in_db'+newstr).innerHTML.replace(/\s/g, '');
	var input_field =  document.getElementById('InputComment'+newstr).value;
	$.ajax({
			data : {
				post_id : post_id,
				input_field : input_field				

			},
			type : 'POST',
			url : '/add_comment2'
		});
};

function delete_comment_l1(element) {
	var num=''; 
	var arr = [];
	var index3;
	for (var index2 = 12; index2 < element.id.length; ++index2){
		var num='';
		if (!isNaN(element.id[index2]/1)){
			num = num+element.id[index2]; 
			index3 = index2+1;
			while (arr){
				if (isNaN(element.id[index3]/1)){
					arr.push(num);
					index2 = index3;
					break};
				num = num + element.id[index3];
				if (index3>100){break};
				index3++;
			};
		}; 		
	};
	var id_who_need = document.getElementById('id'+arr[0]+'LLComment'+arr[1]).innerHTML.replace(/\s/g, '');
	$.ajax({
			data : {
				id : id_who_need
			},
			type : 'POST',
			url : '/delete_comment'
		}).done(function(data) {
			document.getElementById('hide'+arr[0]+'Form'+arr[1]).style.display='none';
		});
};

function edit_post_comment(element){
	var num=''; //start num - 12
	var arr = [];
	var index3;
	for (var index2 = 4; index2 < element.id.length; ++index2){
		var num='';
		if (!isNaN(element.id[index2]/1)){
			num = num+element.id[index2]; 
			index3 = index2+1;
			while (arr){
				if (isNaN(element.id[index3]/1)){
					arr.push(num);
					index2 = index3;
					break};
				num = num + element.id[index3];
				if (index3>100){break};
				index3++;
			};
		}; 		
	};
	var element_textarea = document.getElementById('text'+arr[0]+'AreaEditLL'+arr[1]);
	console.log(element_textarea)
	if (element_textarea.style.display=='none'){
		element.value = 'Отправить';
		element_textarea.value = document.getElementById('text'+arr[0]+'Comments'+arr[1]).innerHTML.replace(/\s/g, '');
		element_textarea.style.display = 'block';
	}
	else {
		element_textarea.style.display = 'none';
		element.value = 'Редактировать';
		$.ajax({
			data : {
				name : document.getElementById('text'+arr[0]+'AreaEditLL'+arr[1]).value,
				id : document.getElementById('id'+arr[0]+'LLComment'+arr[1]).innerHTML.replace(/\s/g, '')
			},
			type : 'POST',
			url : '/edit_post_comment'
		})
		.done(function(data) {
			if (data.error) {
				console.log(data);
			}
			else {
				document.getElementById('text'+arr[0]+'Comments'+arr[1]).innerHTML = data.text;
			}
		});
	}
	
		
};

function showComentsLW(elem ){
	var num=''; //start num - 12
	var arr = [];
	var index3;elem
	for (var index2 = 4; index2 < elem.id.length; ++index2){
		var num='';
		if (!isNaN(elem.id[index2]/1)){
			num = num+elem.id[index2]; 
			index3 = index2+1;
			while (arr){
				if (isNaN(elem.id[index3]/1)){
					arr.push(num);
					index2 = index3;
					break};
				num = num + elem.id[index3];
				if (index3>100){break};
				index3++;
			};
		}; 		
	};
	var show_LW = document.getElementById('level'+arr[0]+'LW'+arr[1]);
	if (show_LW.style.display=='none'){
		show_LW.style.display='block';
	}
	else {
		show_LW.style.display='none';
	}
}
function add_comment_LW2(elem){
	var num=''; 
	var arr = [];
	var index3;
	for (var index2 = 6; index2 < elem.id.length; ++index2){
		var num='';
		if (!isNaN(elem.id[index2]/1)){
			num = num+elem.id[index2]; 
			index3 = index2+1;
			while (arr){
				if (isNaN(elem.id[index3]/1)){
					arr.push(num);
					index2 = index3;
					break};
				num = num + elem.id[index3];
				if (index3>100){break};
				index3++;
			};
		}; 		
	};
	// var show_LW = document.getElementById('level'+arr[0]+'LW'+arr[1]);
	// console.log(elem.id, arr);
	var post_id = document.getElementById('id'+arr[0]+'LLComment'+arr[1]).innerHTML.replace(/\s/g, '');
	var input_field =  document.getElementById('input'+arr[0]+'LW'+arr[1]).value;
	console.log(post_id, input_field);
	$.ajax({
			data : {
				post_id : post_id,
				input_field : input_field				

			},
			type : 'POST',
			url : '/add_comment3'
		});
}


function del_lw(element){
	// console.log(elem);
	var num=''; 
	var arr = [];
	var index3;
	for (var index2 = 12; index2 < element.id.length; ++index2){
		var num='';
		if (!isNaN(element.id[index2]/1)){
			num = num+element.id[index2]; 
			index3 = index2+1;
			while (arr){
				if (isNaN(element.id[index3]/1)){
					arr.push(num);
					index2 = index3;
					break};
				num = num + element.id[index3];
				if (index3>100){break};
				index3++;
			};
		}; 		
	};
	var id_who_need = document.getElementById('id_in_db'+arr[0]+'LW'+arr[1]).innerHTML.replace(/\s/g, '');
	// console.log(id_who_need);
	// document.getElementById('blockAll'+arr[0]+'LW'+arr[1]).style.display='none';
	$.ajax({
			data : {
				id : id_who_need
			},
			type : 'POST',
			url : '/deleteLW'
		}).done(function(data) {
			document.getElementById('blockAll'+arr[0]+'LW'+arr[1]).style.display='none';
		});
};
function edit_lw(element){
	var num=''; 
	var arr = [];
	var index3;
	for (var index2 = 6; index2 < element.id.length; ++index2){
		var num='';
		if (!isNaN(element.id[index2]/1)){
			num = num+element.id[index2]; 
			index3 = index2+1;
			while (arr){
				if (isNaN(element.id[index3]/1)){
					arr.push(num);
					index2 = index3;
					break};
				num = num + element.id[index3];
				if (index3>100){break};
				index3++;
			};
		}; 		
	};
	var textAreaLW = document.getElementById('textArea'+arr[0]+'LW'+arr[1]);
	if (textAreaLW.style.display=='none'){
		element.value = 'Отправить';
		textAreaLW.value = document.getElementById('block'+arr[0]+'LW'+arr[1]).innerHTML.replace(/\s/g, '');
		textAreaLW.style.display = 'block';
	}
	else {
		textAreaLW.style.display = 'none';
		element.value = 'Редактировать';
		$.ajax({
			data : {
				name : document.getElementById('textArea'+arr[0]+'LW'+arr[1]).value,
				id :  document.getElementById('id_in_db'+arr[0]+'LW'+arr[1]).innerHTML.replace(/\s/g, '')
			},
			type : 'POST',
			url : '/edit_commentLW'
		}).done(function(data) {
			if (data.error) {
				console.log(data);
			}
			else {
				document.getElementById('block'+arr[0]+'LW'+arr[1]).innerHTML = data.text;
			}
		});
		
	}
}



// // ******************************ОБРАБОТКА EDIT/DELETE/SHOW*******************************//


// ID Входа facebook
// 605401409963508 
// 2392552961029996
// 618209895325324
