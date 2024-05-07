<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- modal top-up -->
<form action="#" id="modal-topup" class="zoom-anim-dialog mfp-hide modal modal--form">
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>
    <h4 class="sign__title">充值</h4>
    <div class="sign__group sign__group--row">
        <label class="sign__label">您的余额:</label>
        <span class="sign__value">$ ${sessionScope.user.balance}</span>
    </div>
    <div class="sign__group sign__group--row">
        <label class="sign__label" for="value">选择金额：</label>
        <select class="sign__select" name="value" id="value">
            <option value="50">$49</option>
            <option value="100">$99</option>
            <option value="200">$169</option>
        </select>
        <span class="sign__text sign__text--small">您可以从您的帐户中花钱更新连接的包裹，或在我们的网站上购买商品。</span>
    </div>
    <div class="sign__group sign__group--row">
        <label class="sign__label">付款方式:</label>
        <ul class="sign__radio">
            <li>
                <input id="type1" type="radio" name="type" checked="">
                <label for="type1">微信</label>
            </li>
            <li>
                <input id="type2" type="radio" name="type">
                <label for="type2">支付宝</label>
            </li>
            <li>
                <input id="type3" type="radio" name="type">
                <label for="type3">银行卡</label>
            </li>
        </ul>
    </div>
    <button class="sign__btn" type="button">确定</button>
</form>
<!-- end modal top-up -->
<!-- modal info -->
<div id="modal-info" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                    d="M13,16H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM9,10h2a1,1,0,0,0,0-2H9a1,1,0,0,0,0,2Zm12,2H18V3a1,1,0,0,0-.5-.87,1,1,0,0,0-1,0l-3,1.72-3-1.72a1,1,0,0,0-1,0l-3,1.72-3-1.72a1,1,0,0,0-1,0A1,1,0,0,0,2,3V19a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V13A1,1,0,0,0,21,12ZM5,20a1,1,0,0,1-1-1V4.73L6,5.87a1.08,1.08,0,0,0,1,0l3-1.72,3,1.72a1.08,1.08,0,0,0,1,0l2-1.14V19a3,3,0,0,0,.18,1Zm15-1a1,1,0,0,1-2,0V14h2Zm-7-7H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2Z"/></svg>
		</span>
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>
    <h4 class="sign__title">收据</h4>
    <div class="sign__group sign__group--row">
        <label class="sign__label" for="value">总成本:</label>
        <span class="sign__value">$290.99</span>
    </div>
    <div class="sign__group sign__group--row">
        <label class="sign__label" for="value">付款方式: <b>银行卡</b></label>
        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。</span>
    </div>
</div>
<!-- end modal info -->
<!-- modal info -->
<div id="modal-info2" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--green">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                    d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"></path></svg>
		</span>
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>
    <h4 class="sign__title">付款 ￥51 成功!</h4>
    <div class="sign__group sign__group--row">
        <label class="sign__label">总成本:</label>
        <span class="sign__value">$18.00</span>
    </div>
    <div class="sign__group sign__group--row">
        <label class="sign__label">付款方式: <b>银行卡</b></label>
        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。</span>
    </div>
</div>
<!-- end modal info -->
<!-- modal info -->
<div id="modal-info3" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--red">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                    d="M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z"></path></svg>
		</span>
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>
    <h4 class="sign__title">付款 50 失败!</h4>
    <div class="sign__group sign__group--row">
        <label class="sign__label">总成本:</label>
        <span class="sign__value">$18.00</span>
    </div>
    <div class="sign__group sign__group--row">
        <label class="sign__label">付款方式: <b>银行卡</b></label>
        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。</span>
    </div>
</div>
<!-- end modal info -->
<!-- modal info -->
<div id="modal-info4" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                    d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20Zm0-8.5a1,1,0,0,0-1,1v3a1,1,0,0,0,2,0v-3A1,1,0,0,0,12,11.5Zm0-4a1.25,1.25,0,1,0,1.25,1.25A1.25,1.25,0,0,0,12,7.5Z"></path></svg>
		</span>
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>
    <h4 class="sign__title">通知示例。</h4>
    <div class="sign__group sign__group--row">
        <label class="sign__label">自动续订金额：</label>
        <span class="sign__value">$18.00</span>
    </div>
    <div class="sign__group sign__group--row">
        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。</span>
    </div>
</div>
<!-- end modal info -->
<!-- modal info -->
<div id="modal-info5" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--purple">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                    d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z"></path></svg>
		</span>
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>
    <h4 class="sign__title">您已收到礼物!</h4>
    <div class="sign__group sign__group--row">
        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。</span>
        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。</span>
    </div>
</div>
<!-- end modal info -->