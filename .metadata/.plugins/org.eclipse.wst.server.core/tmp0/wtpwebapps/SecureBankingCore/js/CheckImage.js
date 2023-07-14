function checkImageSizeAndExtension() {
	var file = document.getElementById("image");
	var filepath = file.value;
    var ext = filepath.substring(filepath.lastIndexOf('.')+1).toLowerCase();
    if (ext != "jpeg" && ext != "jpg" && ext != "png" ) {
        alert('Please select a valid image file');
        document.getElementById("image").value = '';
        return false;
    }
    var fsize = file.files.item(0).size;
    var s = Math.round((fsize / 1024) * 1024);
    if (s > 512000) {
        alert('Max Upload size is 512 KB only');
        document.getElementById("image").value = '';
        return false;
    }
    return true;
}