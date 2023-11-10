/**
 * 파일업로드 자동생성
 */
$.fn.mkFileUpload = function(name, url, accept, max){
	if(max == undefined) max = 5;
	var txt = '<form name="multiform_' + name + '" id="multiform_' + name + '" action="' + url + '" method="POST" entype="multipart/form-data">';
	txt += '<div>';
	txt += '<input class="custom_file_upload" id="fileupload_' + name + '" type="file" name="fileupload[]" multiple="multiple" />';
	txt += '<div class="custom_file_button" id="fileupload_' + name + '_list"></div>';
	txt += '</div>';
	txt += '</form>';
	this.html(txt);
	$('#fileupload_' + name).MultiFile({ 
        list: '#fileupload_' + name + '_list',
        accept : accept,
        max : max,
        STRING: { //Multi-lingual support : 메시지 수정 가능
            remove : "REMOVE", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
            duplicate : "$file is already selected.", 
            denied : "$ext is a file extension that can not be uploaded.",
            selected:'$file have selected', 
            toomuch: "The maximum size that can be uploaded.($size)", 
            toomany: "The maximum number of uploads is $max.",
            toobig: "$file is very large size. (max $size)"            	

//            remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
//            duplicate : "$file 은 이미 선택된 파일입니다.", 
//            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
//            selected:'$file 을 선택했습니다.', 
//            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
//            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
//            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
        }
    });
};


