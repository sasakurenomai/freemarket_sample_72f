$(function(){

  






  $(".header__inner__main__searchBox--input").on("keyup", function(){
    var input = $(".header__inner__main__searchBox--input").val();
    $.ajax({
      type: 'GET',
      url: '',
      data: {keyword: input},
      dataType: 'json'
    })

    .done(function(items){
      if (items.length !== 0){
        items.forEach(function(item){
          appendItem(item);
        });
      } else {
        appendErrMsgToHTML("一致する検索結果がありません");
      }
    })

  });
});