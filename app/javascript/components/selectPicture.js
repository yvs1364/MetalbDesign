function selectedPicture() {


var container = document.getElementById("image-container");

    function change_img(image){
    var selectPictures = document.getElementsByClassName("picture");
    container.src = image.src;

    for (let selectPicture of selectPictures) {
        if(image !== selectPicture) selectPicture.classList.remove('active');
    };
    image.classList.toggle('active');
    };
};
export { selectedPicture }; 
