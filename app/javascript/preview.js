document.addEventListener('DOMContentLoaded', function(){
  const orderForm = document.getElementById('item-image');
  const previewList = document.getElementById('previews');
  if (!orderForm) return null;

  const fileField = document.querySelector('input[type="file"][name="item[image]"]')
  fileField.addEventListener('change', function(e){
   const alredyPreview = document.querySelector('.preview');
   if (alredyPreview) {
    alredyPreview.remove();
   };
   const file = e.target.files[0];
   const blob = window.URL.createObjectURL(file);
   const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
   const previewImage = document.createElement('img');
   previewImage.setAttribute('class', 'preview-image');
   previewImage.setAttribute('src', blob);

   previewWrapper.appendChild(previewImage);
   previewList.appendChild(previewWrapper);
  });

});
