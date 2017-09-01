$(function(){
   $("#titleError") .hide();
   $("#citationError").hide();
   $("#descriptionError").hide();
   $("#departmentError").hide();
   $("#dateError").hide();
   $("#authorOneError").hide();
   $("#authorTwoError").hide();
   $("#authorThreeError").hide();   
   $("#authorFourError").hide();
   $("#keywordsError").hide();
   
    var titleError = false;
    var citationError = false;
    var descriptionError = false;
    var departmentError = false;
    var dateError = false;
    var authorOneError = false;
    var authorTwoError = false;
    var authorThreeError = false;
    var authorFourError = false;
    var keywordsError = false;
    
    $("#formTitle").focusout(function (){
        checkTitle();
    });
    $("#formCitation").focusout(function (){
        checkCitation();
    });
    $("#formDescription").focusout(function (){
        checkDescription();
    });
    $("#formDepartment").focusout(function (){
        checkDepartment();
    });
    $("#formPublishedOn").focusout(function (){
        checkPublishedDate();
    });
    $("#formAuthor_one").focusout(function (){
        checkAuthor();
    });
    $("#formAuthor_two").focusout(function (){
        checkAuthor();
    });
    $("#formAuthor_three").focusout(function (){
        checkAuthor();
    });
    $("#formAuthor_four").focusout(function (){
        checkAuthor();
    });
    $("#formKeywords").focusout(function (){
        checkKeywords();
    });

    function checkTitle(){
        var title = $("#formTitle").val();
        
        if(title == ""){
            $("#titleError").html("Title can't be empty");
            $("#titleError").show();
            titleError = true;
        }else {
            $("#titleError").show();
        }
            
        if(title.length > 250){
            $("#titleError").html("Title must be less than 250 Characters");
            $("#titleError").show();
            titleError = true;            
        }
    }
    function checkCitation(){
        var citation = $("#formCitation").val();
        
        if(citation == ""){
            $("#citationError").html("Citation can't be empty");
            $("#citationError").show();
            citationError = true;
        }else{
           $("#citationError").hide();
        }
        if(citation > 500){
           $("#citationError").html("Citation must be less than 500 characters");
            $("#citationError").show();
            citationError = true;
        }else{
           $("#citationError").hide();
        }
    }
    
    function checkDescription(){
        var desc = $("#formDescription").val();
        
        if(desc == ""){
            $("#descriptionError").html("Description can't be empty");
            $("#descriptionError").show();
            descriptionError = true;
        }else{
           $("#descriptionError").hide();
        }
      
    }
    
    function checkDepartment(){
        var department = $("#formDepartment").val();
        
        if(department == "select department"){
             $("#departmentError").html("Please select a department");
            $("#departmentError").show();
            descriptionError = true;
        }else{
            $("#departmentError").hide();
        }
    }
    function checkPublishedDate(){
        var date = $("#formPublishedOn").val();
        if(department == ""){
             $("#dateError").html("Published Date can't be empty");
            $("#dateError").show();
            dateError = true;
        }else{
            $("#dateError").hide();
        }
        
    }
    
    
    $("#documentForm").submit(function (){
        titleError = false;
        citationError = false;
        descriptionError = false;
        departmentError = false;
        dateError = false;
        authorOneError = false;
        authorTwoError = false;
        authorThreeError = false;
        authorFourError = false;
        keywordsError = false;
        
        checkTitle();
        checkCitation();
        checkDescription();
        checkDepartment();
        checkAuthor();
        checkPublishedDate();
        checkKeywords();
        
        if(titleError == false && citationError == false && descriptionError == false && dateError == false
                && authorOneError == false && authorOneError == false && authorTwoError == false && authorThreeError == false
                && authorFourError == false && keywordsError == false){
            return true;
        }else{
            return false;
        }
    });
});



