//ҳ����غ���
$(document).ready(function(){
   var subject=$("[name=subject]").val();
    //����ֵ��ѧԺoptionѡ��
   $("#suoshuyuanxi option[value='"+subject+"']").attr("selected","selected"); 
});