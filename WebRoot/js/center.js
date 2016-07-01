/**
 * 在整个浏览器窗口中居中（不考虑滚动）
 */
function centerInScreen(id) {
	var element = document.getElementById(id);
	element.style.position="relative";
	var elementWidth = element.clientWidth;
	var elementHeight = element.clientHeight;
	var top = (document.body.clientHeight-elementHeight) / 2;
	var left = (document.body.clientWidth - elementWidth) / 2;
	element.style.top = top + "px";
	element.style.left = left +"px";
}