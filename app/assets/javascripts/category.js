$(function(){
  function appendOption(category){
    var html = `<option value = ${category.id} data-category = "${category.id}">
                  ${category.name}
                </option>`;
    return html;
  }

  function appendChildrenBox(insertHTML){
    var childrenHTML = `<div class="listing-select-wrapper" id ="children_wrapper"> 
                          <div class="listing-select-wrapper__box">
                            <select class="listing-select-wrapper__box--select item__info--shipping__select" name = "" id="children_category">
                              <option value = "---" data-category="---" >---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
    $("#item_category-box").append(childrenHTML);
  }

  function appendGrandchildrenBox(insertHTML){
    var grandchildrenHTML =`<div id ="grandchildren_wrapper"> 
                              <select class="listing-select-wrapper__box--select item__info--shipping__select" name = "item[category_id]" id="grandchildren_category">
                                <option value = "---" >---</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    $("#item_category-box").append(grandchildrenHTML);
  }

  $('#parent_category').on('change', function(){
    var parentValue = document.getElementById('parent_category').value;
    if (parentValue != "---"){
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('フォームの送信に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  })

  $('#item_category-box').on('change','#children_category',  function(){
    // var childId = $('#children_category option:selected').data('category');
    var childId = document.getElementById('children_category').value;
    if (childId != "---"){
      $.ajax({
        url: '/items/get_category_grandchildren', 
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0){
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });

  
});