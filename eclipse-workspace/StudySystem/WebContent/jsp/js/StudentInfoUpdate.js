//ҳ����غ���
$(document).ready(function(){
   var subject=$("[name=subject]").val();
    //����ֵ��ѧԺoptionѡ��
   $("#suoshuyuanxi option[value='"+subject+"']").attr("selected","selected"); 
   var stuClass=$("[name=stuClass]").val();
   //����ֵ�ð༶optionѡ��
   $("#suoshubanji option[value='"+stuClass+"']").attr("selected","selected");
   var sex=$("[name=sex]").val();
   //����ֵ���Ա�ѡ��
   $(":radio[name='sex'][value='" + sex + "']").attr("checked", "checked");  
});