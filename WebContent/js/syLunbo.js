
	'use strict';

	window.addEventListener('load', function () {
		var carousels = document.querySelectorAll('.carousel');

		for (var i = 0; i < carousels.length; i++) {
			carousel(carousels[i]);
		}
	});

	function carousel(root) {
		var figure = root.querySelector('figure'),
			nav = root.querySelector('nav'),
			images = figure.children,
			n = images.length,
			gap = root.dataset.gap || 0,
			bfc = 'bfc' in root.dataset,
			theta = 2 * Math.PI / n,
			currImage = 0;

		setupCarousel(n, parseFloat(getComputedStyle(images[0]).width));
		window.addEventListener('resize', function () {
			setupCarousel(n, parseFloat(getComputedStyle(images[0]).width));
		});

		setupNavigation();

		function setupCarousel(n, s) {
			var apothem = s / (2 * Math.tan(Math.PI / n));

			figure.style.transformOrigin = '50% 50% ' + -apothem + 'px';

			for (var i = 0; i < n; i++) {
				images[i].style.padding = gap + 'px';
			}for (i = 1; i < n; i++) {
				images[i].style.transformOrigin = '50% 50% ' + -apothem + 'px';
				images[i].style.transform = 'rotateY(' + i * theta + 'rad)';
			}
			if (bfc) for (i = 0; i < n; i++) {
				images[i].style.backfaceVisibility = 'hidden';
			}rotateCarousel(currImage);
		}

		function setupNavigation() {
			nav.addEventListener('click', onClick, true);

			function onClick(e) {
				e.stopPropagation();

				var t = e.target;
				if (t.tagName.toUpperCase() != 'BUTTON') return;

				if (t.classList.contains('next')) {
					currImage++;
				} else {
					currImage--;
				}

				rotateCarousel(currImage);
			}
		}

		function rotateCarousel(imageIndex) {
			figure.style.transform = 'rotateY(' + imageIndex * -theta + 'rad)';
			//2秒后执行
			param=setTimeout(selfChangeImage, 2000);
		}
		//自动循环
		function selfChangeImage() {
			currImage++;
			rotateCarousel(currImage);
		    
		}
		
		/*function myGame(currImage){
			clearTimeout(param);//当鼠标经过(放在)li上的时候停止轮播
			myImg.src="img/"+arr[v];//鼠标经过(放在)那个li上就显示那张图片
			//下面代码是为了当鼠标离开时能够在下一张图片继续滑动而不是在第一张开始
			if(n==currImage){
				n=0;
			}else{
				n=currImage+1;
			}
		}
		function myGo(){
			param=setInterval(fun,1000);
		}*/

	}