$(document).on('turbolinks:load', function() {
    $('#search_title').on('keyup', function () {
        var title = $.trim($(this).val());
        $.ajax({
            type: 'GET', // リクエストのタイプ
            url: '/blogs', // リクエストを送信するURL
            data:  { search_title: title }, // サーバーに送信するデータ
            dataType: 'json' // サーバーから返却される型
        })
        .done(function(data){ // dataにはレスポンスされたデータが入る
            //通信に成功した際の処理
            $('#blogs td').remove();
            console.log(data);
            $(data).each(function(i,blog) {
                $('#blogs').append(
                    `<td class=".blog">ID:${blog.id}  作成日：${blog.created_at}</td>`
                );
            })
        });
    });
});