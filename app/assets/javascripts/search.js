var jqxhr;
$('#search_title').on('keyup', function () {
    const title = $(this).val();
    // タイトルが空なら何もしない
    if (title != ""){
        if (jqxhr) {
            jqxhr.abort();
            console.log("中断しました");
        }
        jqxhr = $.ajax({
            type: 'GET', 
            url: '/blogs',
            data:  { search_title: title },
            dataType: 'json' 
        })
        .done(function(data){
            //通信に成功した際の処理
            $('#blogs').remove();
            console.log(data);
            $('.table').append(`<tbody id="blogs"></tbody>`);
            $(data).each(function(i,blog) {
                $('#blogs').append(
                    `<tr>
                    <td>${blog.title}</td>
                    <td><a href="blogs/${blog.id}" class="btn btn-primary">詳細</a></td>
                    <td><a href="blogs/${blog.id}/edit" class="btn btn-primary">編集</a></td>
                    <td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="blogs/${blog.id}" class="btn btn-primary">削除</a></td>
                    <tr>`
                );
            })
        });
    }
});