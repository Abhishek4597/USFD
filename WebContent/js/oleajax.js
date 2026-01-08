function myFunction( x) {   
	//alert(mz);
		//alert("event fired");
	   
	    $.get('ExamController', {
	            userName : x, mz:x, Recordid:recordid
	    });	 
}

function saveAnswer(ansno, qid, recordid) {   
//	alert("event fired");
	//alert(".......INSIDE SAVE ANSWER AJAX FN ansno"+ansno+"queid"+qid+"recordid"+recordid);
		//alert("event fired");
	    //var name =$('#userName').val();
	    $.post('ExamController?action=saveAnswer', 
	    		{ Ans : ansno, Queid:qid, Recordid:recordid});	 
	
}

function closeExam(recordid) {   
//alert("close exam event fired");
	//alert(".......INSIDE SAVE ANSWER AJAX FN ansno"+ansno+"queid"+qid+"recordid"+recordid);
		//alert("event fired");
	    //var name =$('#userName').val();
	    $.post('ExamController?action=closeExam', 
	    		{ Recordid:recordid});	 
	
}

function getQuestions() {   
	var a= $('#subject_id option:selected').text(); //this will give text part from ddlb
	var  subjectid=$("#subject_id").val(); //this will give value part from drop d lb
//	var qvh=$("#vh").val(); //this will return value by field id
//	var qh =$("#h").val(); //this will return value by field id
//	var qm =$("#m").val(); //this will return value by field id
//	var qe=$("#e").val();		//this will return value by field id
//	var qvh= $('[name=vh]').val() // this will return the value of a html field (viz text box etc) by name
	var qvh=$('[name=vh]').val(); //this will return value by field name
	var qh =$('[name=h]').val(); //this will return value by field name
	var qm =$('[name=m]').val(); //this will return value by field name
	var qe=$('[name=e]').val();		//this will return value by field name
	alert(qvh);
  $.post('QuestionController?action=prepareqset', {
     
          subject:subjectid, vh:qvh,h:qh,m:qm,e:qe
  }, function(responseText) {
          $('#ajaxGetUserServletResponse').text(responseText);
  });	 

}	    
