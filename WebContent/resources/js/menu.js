//메뉴 hover
$(document).ready(function(){
		$('.outer-menu-item').hover(function(){
			$(this).find('.inner-menu').show();
		}, function(){
			$(this).find('.inner-menu').hide();
		});
	});
//장바구니 기능
function addToCart(){
	if(confirm("상품을 추가하시겠습니까?")){
		
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
}
//수량 변경되는 기능
function change(num){
	var x=document.form;
	var y=Number(x.count.value)+num;
	if(y<1) y=1;
	if(y>20) y=20;
	x.count.value=y;
}
