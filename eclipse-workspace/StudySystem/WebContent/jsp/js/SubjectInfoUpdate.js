
//ҳ����غ���
$(document).ready(function(){
   var subjectName=$("[name=subjectName]").val();
    //����ֵ��ѧԺoptionѡ��
   $("#suoshuyuanxi option[value='"+subjectName+"']").attr("selected","selected"); 
});