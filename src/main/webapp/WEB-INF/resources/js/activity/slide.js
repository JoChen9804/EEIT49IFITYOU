
        $(function () {
            /*
            1.放第一張圖
            2.放n張圖
            3.放分頁
            4.第一張圖移動
            */

            let index = 0
            let slideMove = 0
            $('.pages li').eq(0).css('background', 'white')

            /*底部頁數欄跳動*/
            $('.pages li').on('mouseenter', function () {
                index = $(this).index()
                console.log(index)

                slideMove = 0 - index * 800
                $('.slide-img').css('left', slideMove)
                $(this).css('background', 'white').siblings().css('background', 'transparent')

            })
            let pagesLi = $('.pages li').length
            /*案往右鍵*/
            $('#slideNext').on('click', function () {
                index++;
                if (index >= pagesLi) {
                    index = 0
                }
                moveImg()
            })

            /*案往左鍵*/
            $('#slidePrev').on('click', function () {
                index--;
                if (index < 0) {
                    index = pagesLi - 1
                }
                moveImg()
            })

            /*重複動作可以取出做成function*/
            function moveImg() {
                slideMove = 0 - index * 800
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            }

            setInterval(autoImg, 2000)
            function autoImg() {
                index++
                if (index >= pagesLi) {
                    index = 0
                }
                moveImg()
            }

        })
