// Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
var previewNode = document.querySelector("#template");
previewNode.id = " ";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);

//generate a uuid and append it in a hidden input to the dropzone form
var uuidInput = document.createElement("input");
var uuidInput2 = document.createElement("input");

uuidInput.type = "hidden";
uuidInput.name = "batchId";
uuidInput.value = guid();
uuidInput2.type = "hidden";
uuidInput2.name = "batchId";
uuidInput2.value = uuidInput.value;

document.querySelector("#myDropzone").appendChild(uuidInput);
document.querySelector("#continueForm").appendChild(uuidInput2);


var myDropzone = new Dropzone(document.querySelector("#myDropzone"), {
    url: "/uploadFile", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
});

myDropzone.on("addedfile", function(file) {

});

// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
});

myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1";
    // And disable the start button
//  file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
});

// Hide the total progress bar when nothing's uploading anymore
myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0";
    document.querySelector("#actions .continue").disabled = "";
    document.querySelector("#actions .continue").onclick = function(){
        document.querySelector("#continueForm").submit();
    };
});

// Setup the buttons for all transfers
// The "add files" button doesn't need to be setup because the config
// `clickable` has already been specified.
document.querySelector("#actions .start").onclick = function() {
    if(filesAreInPairs())
    {
        myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
    }
    else
    {
        // throw error message
        showAlert();
    }
};
document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true);
};

function filesAreInPairs()
{
    files = myDropzone.getFilesWithStatus(Dropzone.ADDED);

    for(i = 0; i < files.length; i++)
        if(!checkFile(files[i]))
            return false;

    return true;
}

function checkFile(file)
{
    var allFiles = myDropzone.getFilesWithStatus(Dropzone.ADDED),
        fileRegex = /(.+?)(\.[^.]*$|$)/,
        fileExtension = fileRegex.exec(file.name)[2],
        fileName = fileRegex.exec(file.name)[1],
        found = false;

    allFiles.forEach(function(thisFile){
        if(fileExtension == ".msa" && thisFile.name == fileName + ".png")
            found = true;

        if(fileExtension == ".png" && thisFile.name == fileName + ".msa")
            found = true;
    });

    return found;
}

function hideAlert()
{
    document.querySelector("#alert").style.display = "none";
}

function showAlert()
{
    document.querySelector("#alert").style.display = "block";
}

function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
        s4() + '-' + s4() + s4() + s4();
}