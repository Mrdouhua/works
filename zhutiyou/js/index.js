function navSlide(){

	// curPostion和curPostion_1为所触发的li元素离其父元素左侧的距离值；thisLeft则为滑动块所在位置的left值
    var curPostion, thisLeft, curPostion_1;

    var obj = getElement('#navUl'),
        navCur = getElement('#curNav'),
        liArr = obj.querySelectorAll('li'),
        liLength = liArr.length-1,
        timer = null;

        for(var x = 0; x < liArr.length; x++) {
             // liArr[liLength].style.paddingRight = "0";
             var li = liArr[x],
                 curPostion = navCur.offsetLeft;

             if(li.className == "cur"){
                 navCur.style.left = li.offsetLeft + "px";
             }
             li.onmouseover = function(){
                clearTimeout(timer);
                thisLeft = this.offsetLeft;
                if (thisLeft > navCur.offsetLeft)
                {
                    hover();
                }
                else
                {
                    curPostion_1 = this.offsetLeft;
                    out();
                }
             };
 
             li.onmouseout = function(){
                clearTimeout(timer);
                if(curPostion < navCur.offsetLeft){
                    curPostion_1 = curPostion;
                    out();
                }
                else
                {
                    thisLeft = curPostion;
                    hover();
                }
             };
        }



        function hover(){
            if(navCur.offsetLeft <= thisLeft){
                var a = Math.max(parseInt((thisLeft - navCur.offsetLeft) / 20), 3);
                    navCur.style.left = navCur.offsetLeft + a + "px";
                    timer = setTimeout(arguments.callee, 15);
            }
            else
            {
                navCur.style.left = thisLeft + "px";
                clearTimeout(timer);
            }
        }

        function out(){
            if(navCur.offsetLeft >= curPostion_1){
                var a = Math.max(parseInt((navCur.offsetLeft - curPostion_1) / 20), 3);
                    navCur.style.left = navCur.offsetLeft - a + "px";
                    timer = setTimeout(arguments.callee, 15);
                }
            else
            {
                navCur.style.left = curPostion_1 + "px";
                clearTimeout(timer);
            }
        }

        function getElement(selector){
            return document.querySelector(selector)
        }
}

window.onload = function() {
	navSlide();
    var container = document.getElementById('container');
            var list = document.getElementById('list');
            var buttons = document.getElementById('buttons').getElementsByTagName('span');
            var prev = document.getElementById('prev');
            var next = document.getElementById('next');
            var index = 1;
            var len = 5;
            var animated = false;
            var interval = 4000;
            var timer;


            function animate (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 300;
                var inteval = 10;
                var speed = offset/(time/inteval);
                var left = parseInt(list.style.left) + offset;

                var go = function (){
                    if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                        list.style.left = parseInt(list.style.left) + speed + 'px';
                        setTimeout(go, inteval);
                    }
                    else {
                        list.style.left = left + 'px';
                        if(left>-200){
                            list.style.left = -1348 * len + 'px';
                        }
                        if(left<(-1348 * len)) {
                            list.style.left = '-1348px';
                        }
                        animated = false;
                    }
                }
                go();
            }

            function showButton() {
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons[i].className == 'on'){
                        buttons[i].className = '';
                        break;
                    }
                }
                buttons[index - 1].className = 'on';
            }

            function play() {
                timer = setTimeout(function () {
                    next.onclick();
                    play();
                }, interval);
            }
            function stop() {
                clearTimeout(timer);
            }

            next.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-1348);
                showButton();
            }
            prev.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                animate(1348);
                showButton();
            }

            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    if (animated) {
                        return;
                    }
                    if(this.className == 'on') {
                        return;
                    }
                    var myIndex = parseInt(this.getAttribute('index'));
                    var offset = -1348 * (myIndex - index);

                    animate(offset);
                    index = myIndex;
                    showButton();
                }
            }

            container.onmouseover = stop;
            container.onmouseout = play;

            play();
}
