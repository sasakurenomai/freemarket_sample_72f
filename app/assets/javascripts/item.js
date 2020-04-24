$(function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image_url]"
                    id="item_item_images_attributes_${index}_id"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  const buildFileFields = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-files" type="file"
                    name="item[item_images_attributes][${index}][image_url]"
                    id="item_item_images_attributes_${index}_id"><br>
                    <div class="js-removes">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url) => {
    const html = `<div class="item_image">
    <img data-index="${index}" src="${url}" width="100px" height="100px">
      <div class="js-remove2">削除</div>
    </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e){
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    $('.label-box').attr({id: `label-box--${new_id}`,for: `item_item_images_attributes_${new_id}_id`});
  });

  $('#image-box').on('change', '.js-files', function(e){
    $('#image-box').append(buildFileFields(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    var new_id = parseInt(id) + 1;
    $('.label-box').attr({id: `label-box--${new_id}`,for: `item_item_images_attributes_${new_id}_id`});
  });

  $('#image-box').on('click', '.js-remove', function(){
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck){ hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();}
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  $('#image-box').on('click', '.js-remove2', function(){
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck){ hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();}
    if ($('.js-files').length == 0) $('#image-box').append(buildFileFields(fileIndex[0]));
  });

  $('#image-box').on('change', '.js-files', function(e){
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if(img = $(`img[data-index="${targetIndex}]`)[0]){
      img.setAttribute('src', blobUrl);
    }else{
      $('#previews').append(buildImg(targetIndex, blobUrl));
    }
  });

  $('#image-box').on('click', '.js-removes', function(){
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck){ hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();}
    if ($('.js-file').length == 0) $('#image-box').append(buildFileFields(fileIndex[0]));
  });
});
