
$(document).ready(function(){
	var courseType=$("[name=courseType]").val();
    //����ֵ�ÿγ�����optionѡ��
	$("#classKinds_add option[value='"+courseType+"']").attr("selected","selected"); 
   
});