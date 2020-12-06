function CheckAddProduct(){
	var productId=document.getElementById("productId");
	var name=document.getElementById("name");
	var fixedPrice=document.getElementById("fixedPrice");
	var unitsInStock=document.getElementById("unitsInStock");
	
	// 상품아아디 체크
	if (!check(/^[P|S|C][0-9]{4,11}$/, productId,
			"[상품 코드]\nP,S,C중에서의 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P,S,C중에서 시작하세요"))
		return false;
	// 상품명 체크
	if (name.value.length < 4 || name.value.length > 50) {
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	// 상품 가격 체크
	if (fixedPrice.value.length == 0 || isNaN(fixedPrice.value)) {
		alert("[가격]\n작성하실 부분입니다. 숫자만 입력하세요");
		fixedPrice.select();
		fixedPrice.focus();
		return false;
	}

	if (fixedPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		fixedPrice.select();
		fixedPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, fixedPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;

	// 재고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}