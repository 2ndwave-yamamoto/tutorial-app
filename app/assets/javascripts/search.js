$(document).on('turbolinks:load', function() {
    let search_title = document.getElementById("search_title");
    search_title.addEventListener('input', () => {
        // 入力された文字
        let title = $("#search_title").val();
        console.log(title);

        $.ajax({
            type: 'GET', // リクエストのタイプ
            url: '/blogs', // リクエストを送信するURL
            data:  { search_title: title }, // サーバーに送信するデータ
            dataType: 'json' // サーバーから返却される型
        })
        .done(function(data){ // dataにはレスポンスされたデータが入る
            //通信に成功した際の処理
            console.log(data);
        })
    });
});