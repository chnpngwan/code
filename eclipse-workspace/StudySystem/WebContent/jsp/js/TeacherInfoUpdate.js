//ҳ����غ���
$(document).ready(function(){
   var type=$("[name=type]").val();
    //����ֵ��ѧԺoptionѡ��
   $("#suoshuyuanxi option[value='"+type+"']").attr("selected","selected"); 
   var sex=$("[name=sex]").val();
   //����ֵ���Ա�ѡ��
   $(":radio[name='sex'][value='" + sex + "']").attr("checked", "checked");  
});