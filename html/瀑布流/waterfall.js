// 读取用户屏幕第一行放了多少张图
// 操作下一张图，找到上一行最矮的高度，将图片排放到其下方

function imgLocation(parent,content){  // 当前有多少图片要摆放

    // 获取到大盒子cparent(大盒子内存放了很多个box，其中每一个box盒子存放着一张图片)
    var cparent = document.getElementById(parent)
    // 将大盒子cparent中所有的box盒子存放在一个数组ccontent中
    var ccontent = getChildElement(cparent,content)
    // 获取到第一张图片的宽度(已知每一张图片的宽度都相同)
    var imgWidth = ccontent[0].offsetWidth
    // 其中num计算后为页面一行能存放图片的张数，也就是一行能放多少个box盒子
    // document.documentElement.clientWidth 获取整个屏幕的宽度
    var num = Math.floor(document.documentElement.clientWidth/imgWidth)
    cparent.style.cssText = `width: ${imgWidth*num}px`

    // 创建一个数组用来存放第一行每个图片的高度(此处高度会随着新图片的插入而变大)
    var BoxHeightArr = []
    for(var i=0; i<ccontent.length; i++){
        if(i<num){
            // 先将第一行放满
            BoxHeightArr[i] = ccontent[i].offsetHeight
        }else{   // 要操作的图

            /* 找到高度最小值图片对应的下标 */
            // 获取到第一行中的高度最小值
            // apply为借用前面的Math.min方法给数组，不能直接使用Math.min找到数组中的最小值
            var minHeight = Math.min.apply(null,BoxHeightArr)
            // 找到高度最小值对应在数组BoxHeightArr中的下标
            var minIndex = BoxHeightArr.indexOf(minHeight)
            /* 找到高度最小值图片对应的下标 */


            /* 新插入的图片进行定位 */
            // 将新要插入的图片设置为绝对定位
            ccontent[i].style.position = 'absolute'
            // 将新要插入的图片的顶部到页面顶部的距离设置为找到的最小的高度值
            ccontent[i].style.top = minHeight +'px'
            // 将新要插入的图片的左边到页面左边的距离设置和最小高度图片的左边到页面的距离相同，
            // 使两张图片左边对齐
            ccontent[i].style.left = ccontent[minIndex].offsetLeft+'px'
            /* 新插入的图片进行定位 */

            // 更新这一列的高度(这里很关键，因为数组中只会存放num（一行放图片的数目）个元素，
            // 所以插入新图片后原来高度最小值就未必是最小了)
            BoxHeightArr[minIndex] = BoxHeightArr[minIndex] + ccontent[i].offsetHeight
        }
    }
}


// 定义一个函数获取一个容器内中某个容器的数目(此处为获取所有container容器内的box容器)
function getChildElement(parent,content){
    var contentArr = []
    var allContent = parent.getElementsByTagName("*")
    for(var i=0;i<allContent.length;i++){
        if(allContent[i].className == content){
            contentArr.push(allContent[i])
        }
    }
    return contentArr
}


imgLocation('container','box')
