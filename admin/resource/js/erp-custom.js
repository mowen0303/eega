function getTax(v){
    return Math.round(Number(v) * 0.13);
}

jQuery.fn.select2CheckDuplicate = function(){
    $(this).on('change',function(){
        let isValidateSelection = true;
        const urlParams = new URLSearchParams(window.location.search);
        const stockType = urlParams.get('type');
        const currentVal = $(this).val();
        const currentObj = $(this);
        const quantityInputObj = $(this).parents('.item-box').find('.quantity-input').eq(0);
        const beCheckedObj =  $(this).parents('.item-box').siblings().find('.select3');
        const maxQuantity = parseInt(currentObj.children('option:selected').attr('data-quantity'));
        const errorMsgObj = currentObj.parents('.item-box').find('.num-box');
        if(stockType == "out"){
            quantityInputObj.prop("max",maxQuantity);
            quantityInputObj.off('keyup');
            quantityInputObj.keyup(function(){
                if(parseInt($(this).val()) > maxQuantity){
                    errorMsgObj.addClass('error');
                    Swal.fire('Oops...', `The current stock quantity is only left ${maxQuantity}`, 'warning');
                    $(this).val(maxQuantity);
                } else {
                    errorMsgObj.removeClass('error')
                }
            })
        }
        beCheckedObj.each(function(){
            if($(this).val() !== ""){
                if($(this).val() == currentVal){
                    errorMsgObj.addClass('error');
                    Swal.fire('Oops...', `You had selected the item already!`, 'warning');
                    isValidateSelection = false;
                    return false;
                }else{
                    isValidateSelection = true;
                    errorMsgObj.removeClass('error')
                }
            }
        })
        if(currentVal!="") {
            quantityInputObj.prop('disabled',!isValidateSelection);
        }else{
            quantityInputObj.prop('disabled',isValidateSelection);
        }
    })
};

jQuery.fn.selectInput = function(getSelectDataAPI,creatNewItemAPI,createButtonTitle,selectCallBackFn){
    $(this).append($(`
        <div class="flex-row select-box">
            <select class="form-control flex-1 m-r-10" style="display: none" name="company_country" data-defvalue="<?php echo $row['company_country']?>">
            </select>
            <a href="#" id="addBtn">+ ${createButtonTitle}</a>
        </div>
        <div class="flex-row input-box" style="display: none">
            <input type="text" class="form-control input flex-1 m-r-10" placeholder="">
            <div>
                <button id="done-btn" type="button" class="btn btn-primary btn-sm editable-submit"><i class="glyphicon glyphicon-ok"></i></button>
                <button id="cancel-btn" type="button" class="btn btn-default btn-sm editable-cancel"><i class="glyphicon glyphicon-remove"></i></button>
            </div>
        </div>
    `));
    let select = $(this).find("select");
    let addBtn = $(this).find("#addBtn");
    let selectBox = $(this).find(".select-box");
    let inputBox = $(this).find(".input-box");
    let input = (this).find("input");
    let doneBtn = $(this).find("#done-btn");
    let cancelBtn = $(this).find("#cancel-btn");


    axios.post(getSelectDataAPI)
        .then(function (response) {
            if(response.data.code == 200){
                let result = response.data.result;
                if(Array.isArray(result)){
                    result.forEach(item=>{
                        select.append($(`<option value="${item.orders_id}">${item.orders_name}</option>`));
                    });
                    select.show();
                }
                selectCallBackFn && selectCallBackFn(select.val());
            }
        })
        .catch(function (error) {
            // console.log(error);
            Swal.fire('Oops...', `${error}`, 'error');
        })
        .then(function () {
            // always executed
        });

    select.change(function(){
        selectCallBackFn && selectCallBackFn(select.val());
    })

    addBtn.click(function(){
        selectBox.hide();
        inputBox.show();
        return false;
    })

    doneBtn.click(function(){
        let params = new URLSearchParams();
        params.append('orders_name', input.val());

        axios.post(creatNewItemAPI,params)
            .then(function (response) {
                if(response.data.code == 200){
                    select.prepend($(`<option selected value="${response.data.result}">${input.val()}</option>`));
                    select.select('')
                    input.val("");
                    selectBox.show();
                    select.show();
                    inputBox.hide();
                    selectCallBackFn && selectCallBackFn(select.val());
                }
            })
            .catch(function (error) {
                Swal.fire('Oops...', 'here a network errors, please try again later', 'error')
            })
            .then(function () {
                // always executed
            });
    })

    cancelBtn.click(function(){
        selectBox.show();
        inputBox.hide();
        input.val("");
    })
};

function select2FormatState (opt) {
    if (!opt.id) {
        return opt.text;
    }
    var optimage = $(opt.element).data('image');
    if(!optimage){
        return opt.text;
    } else {
        var $opt = $(
            '<span><img class="avatar avatar-30 img-rounded" src="' + optimage + '"/> ' + opt.text + '</span>'
        );
        return $opt;
    }
};

function getQueryVariable(variable) {
    const query = window.location.search.substring(1);
    const vars = query.split("&");
    for (let i=0;i<vars.length;i++) {
        let pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}

//alert
let alertTimeout = null;
function showAlert(message,type=null){
    let $alertItem = $("#adminAlert");
    let $textItem = $alertItem.find("span");
    let $closeBtn = $alertItem.find(".closed");
    let $alertIcon = $alertItem.find("#alertIcon");
    clearTimeout(alertTimeout);
    if(type=="error"){
        $alertItem.attr("class","myadmin-alert alert-danger myadmin-alert-top alerttop");
        $alertIcon.attr("class","mdi mdi-information fa-fw");
    }else{
        $alertItem.attr("class","myadmin-alert alert-success myadmin-alert-top alerttop");
        $alertIcon.attr("class","mdi mdi-check-circle fa-fw");
    }
    $textItem.text(message);
    $alertItem.stop().slideDown(function(){
        alertTimeout = setTimeout(function(){
            $alertItem.stop().slideUp();
        },8000)
    });
    $closeBtn.click(function(){
        $alertItem.stop().slideUp();
    });
}

function hideAlert(){
    $("#adminAlert").stop().slideUp();
}

function setDefaultValue(){
    $("select[data-defvalue]").each(function () {
        var val = $(this).attr("data-defvalue");
        var option = $(this).find("option");
        option.each(function(){
            if($(this).val()==val){
                $(this).prop("selected", "selected");
            }
        })
    });
}

function registerUserSearchSelectAjax(){
    $(".user-search-select-ajax").select2({
        ajax: {
            url: "/restAPI/userController.php?action=searchUser",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    searchValue: params.term
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data.result, function (item) {
                        return {
                            text: `${item.user_first_name} ${item.user_last_name} (${item.user_email})`,
                            id: item.user_id
                        }
                    })
                };
            },
            cache: true
        },
        placeholder: 'Search for a user',
        minimumInputLength: 1
    });
}

$(document).ready(function () {

    //产品图片
    const productImgArr = $(".large-img-box");
    if(productImgArr.length>0){
        let lastSmallImgIndex = 0;
        let productImgSmallArr = $(".product-img-small");
        productImgSmallArr.eq(0).addClass("selected");
        productImgArr.eq(0).addClass("selected");
        productImgSmallArr.each(function(index){
            let currentSmallImg = $(this);
            let currentProductImg = productImgArr.eq(index);
            currentSmallImg.hover(
                function(){
                    if(index != lastSmallImgIndex){
                        productImgSmallArr.eq(lastSmallImgIndex).removeClass('selected');
                        productImgArr.eq(lastSmallImgIndex).removeClass('selected');
                        currentSmallImg.addClass('selected');
                        currentProductImg.addClass('selected');
                        lastSmallImgIndex = index;
                    }
                }
            )
        })

    }

    //select Default value
    setDefaultValue();

    //上传插件
    if($('.dropify').length>0){

        let drEvent = $('.dropify').dropify();
        let $input = $("<input>")

        drEvent.each(function(){
            let name = $(this).attr("data-name");
            $(this).parent().append($(`<input type="hidden" value="0" name="${name}" id="${name}"></input>`))
        })

        drEvent.on('dropify.fileReady', function(event, element){
            let name = $(this).attr("data-name");
            $("input[name='deleteUploadedImage']").val(false);
            console.log($("input[name='deleteUploadedImage']").val())
            // console.log($(this).siblings(`#${name}`).val(1))

        });

        drEvent.on('dropify.beforeClear', function(event, element){
            return confirm("Do you really want to delete the Image ?");
        });

        drEvent.on('dropify.afterClear', function(event, element){
            let name = $(this).attr("data-name");
            // console.log($(this).siblings(`#${name}`).val(-1))
            $("input[name='deleteUploadedImage']").val(true);
            // console.log($(this))
        });
    }

    //checkBox
    $("#cBoxAll").change(function () {
        if(this.checked){
            $(".cBox").each(function(){
                $(this).prop("checked",true);
                $("#deleteBtn").show();
            })
        }else{
            $(".cBox").each(function(){
                $(this).prop("checked",false)
                $("#deleteBtn").hide();
            })
        }
    });

    $(".cBox").each(function(){
        $(this).change(function(){
           if($(".cBox:checked").length>0){
               $("#deleteBtn").show();
           }else{
               $("#deleteBtn").hide();
           }
        })
    })

    //修改上传图片
    $('#currentImages').children('div').each(function(i,ele){
        let $btn = $(ele).find('.overlay');
        $btn.click(function(){
            $(ele).remove();
        });
    });


    //高亮搜索
    const searchValue = getQueryVariable('searchValue');
    $("*[data-hl-search]").each(function(){
        const htmlText = $(this).html();
        const exp = new RegExp(searchValue,"gi");
        const newText = htmlText.replace(exp,"<span class='text-danger'>$&</span>");
        $(this).html(newText);
    })

    //高亮排序
    const orderByValue = getQueryVariable('orderBy');
    const sort = getQueryVariable('sort');
    const s = getQueryVariable('sort');
    $(`a[data-hl-orderby]`).each(function(){
        $(this).append("<span></span>")
    })

    $(`a[data-hl-orderby=${orderByValue}]`).each(function(){
        if(sort == 'asc'){
            $(this).find("span").addClass('up')
        }else if(sort == 'desc'){
            $(this).find("span").addClass('down')
        }
    })

    registerUserSearchSelectAjax();


    //inventory select
    const firstItemNode = $("#item-box-template");

    setTimeout(function(){
            const iniData = $(".item-box-ini-data");
            if(iniData.length>0){
                let iniSelectedArr = [];
                let iniQuantityArr = [];
                iniData.each(function(){
                    iniSelectedArr.push($(this).attr('data-item-id'));
                    iniQuantityArr.push($(this).attr('data-item-quantity'));
                })
                copyInventoryBox(firstItemNode,0,iniSelectedArr,iniQuantityArr);
            }else{
                copyInventoryBox(firstItemNode,5);
            }
        },200
    )

    $("#add-item-btn").click(function(){
        copyInventoryBox(firstItemNode,5);
    })

    function registerUserNameInput(){
        let userNameInput = $("#userNameInput");
        let userNameInputDatalist = $("#userNameInputDatalist");
        let timeout = null;

        userNameInput.focus(function(){
            clearTimeout(timeout);
            userNameInputDatalist.slideDown();
        }).focusout(function(){
            timeout = setTimeout(function(){userNameInputDatalist.slideUp()},200);
        })

        userNameInput.on('input', function(e) {
            if($("#userNameSearchErrorBox").not(":animated")){
                $("#userNameSearchErrorBox").slideUp();
            }
            let url = `/restAPI/userController.php?action=searchUser&searchValue=${this.value}&dataType=json`;
            fetch(url).then(response => response.json()).then(json => {
                if (json.code === 200) {
                    let $dataListOption = "";
                    json.result && json.result.forEach(item => {
                        $dataListOption += `<div class="valDom" data-user-id="${item.user_id}" data-val="${item.user_name}">${item.user_first_name} ${item.user_last_name} - ${item.user_name}</div>`;
                    });
                    userNameInputDatalist.html($dataListOption);
                    $(".valDom").click(function(event){
                        event.stopPropagation();
                        userNameInput.val($(this).attr('data-val')).attr('data-user-id',$(this).attr('data-user-id'))
                    })
                }
            }).catch(error => {
                alert(error);
            });
        });
    }

    function copyInventoryBox(copiedNode,quantity,iniSelectedArr=[],iniQuantityArr=[]){
        const inventoryNode = $("#inventory-box");
        const lastItemCount = parseInt($("#inventory-box .item-box:last-child .num").text()) || 0;
        let newNode = null;
        let newNodes = $();
        if(iniSelectedArr.length > 0){
            quantity = iniSelectedArr.length;
        }
        for(let i = lastItemCount+1; i<=lastItemCount+quantity; i++){
            newNode = copiedNode.clone().appendTo(inventoryNode);
            newNode.find('.num').text(i);
            newNode.css({'display':'block'})
            newNodes = newNodes.add(newNode.find(".select3"));
        }
        newNodes.select2({
            templateResult: select2FormatState,
            templateSelection: select2FormatState
        });

        if(iniSelectedArr.length > 0){
            for(let i = 0; i<iniSelectedArr.length; i++){
                newNodes.eq(i).val(iniSelectedArr[i]);
                newNodes.eq(i).trigger('change');
                newNodes.eq(i).parents('.item-box').find('.quantity-input').eq(0).attr('disabled',false).val(iniQuantityArr[i]);
            }
        }
        newNodes.select2CheckDuplicate();
    }

    $("#submitBtn").click(function(){
        if($("#inventory-box .error").length>0){
            Swal.fire('Oops...', 'There are some errors in your inventory form, please fix the errors before submit.', 'error');
            return false;
        }else{
            return true;
        }
    })

    //participant part start
    const participantsWrap = $("#participantsWrap");
    if(participantsWrap.length>0){
        //build DOM
        const participantMax = participantsWrap.attr("data-max");
        let addButtonDom = $("<div class='participantsBtnWrap'></div>");
        let groupIndex = 1;
        let rowDom = null;
        for(let i = 0; i < participantMax; i++){
            let isNewLine = i%4==0;
            if(isNewLine){
                rowDom = $("<div class='participantsBtnRow'><div class='participantsGroupTitle'>Group "+ groupIndex++ +"</div></div>");
                rowDom.appendTo(addButtonDom);
            }
            $("<div class='participantsBtn' data-index='"+i+"'>+</div>").appendTo(rowDom)
        }
        addButtonDom.appendTo(participantsWrap);

        //add data
        const eventId = participantsWrap.attr('data-event-id');
        let url = `/restAPI/eventController.php?action=getParticipants&event_id=${eventId}&dataType=json`;
        let options = {
            method: "GET",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            credentials: 'same-origin',
        };

        fetch(url,options)
            .then(response=>response.json())
            .then(json=>{
                if(json.code === 200){
                    const {result} = json;
                    result && result.forEach(x=>{
                        $(".participantsBtn").eq(x.participant_index).text(`${x.user_first_name} ${x.user_last_name}`).attr('data-user-id',x.participant_user_id)
                    })
                }else{
                    alert(json.message)
                }
            })

        $(".participantsBtn").each(function(index){
            $(this).click(function(){
                let currentBtnDOM = $(this);
                if(currentBtnDOM.text() == "+"){
                    let html =`
                        <div class="modal-box">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h3 class="modal-title">Enroll to the event</h3>
                            </div>
                            <div class="modal-body">
                                <div id="userNameSearchErrorBox" class="alert alert-danger" style="display: none"></div>
                                <table class="table m-b-0">
                                    <tr>
                                        <td width="90"><b>User name</b></td>
                                        <td>
                                            <div id="userNameSearchWrap">
                                                <input id="userNameInput" class="form-control" placeholder="User Name" type="text" value="">
                                                <datalist id="userNameInputDatalist"></datalist>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button id="enrollConfirmBtn" type="button" class="btn btn-danger"><div class="lds-dual-ring loadingIcon"></div>Enroll</button>
                            </div>
                        </div>
                    `;

                    Swal.fire({
                        html:html,
                        width:640,
                        showConfirmButton: false,
                    });

                    registerUserNameInput();

                    $("#enrollConfirmBtn").click(function(){
                        try{
                            $("input[name=participant_index]").val(index);
                            $("input[name=participant_user_id]").val($("#userNameInput").attr("data-user-id"));
                            if(!$("input[name=participant_user_id]").val()){
                                throw new Error("Please designate a user")
                            }
                            let url = "/restAPI/eventController.php?action=addParticipantByAdmin&dataType=json";
                            let options = {
                                method: "POST",
                                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                                body: $("#participantsForm").serialize(),
                                credentials: 'same-origin',
                            };
                            fetch(url,options)
                                .then(response=>response.json())
                                .then(json=>{
                                    if(json.code === 200){
                                        const {result} = json;
                                        const name = `${result.user_first_name} ${result.user_last_name}`;
                                        currentBtnDOM.text(name).attr('data-user-id',result.participant_user_id);
                                        Swal.close();
                                    }else{
                                        $("#userNameSearchErrorBox").text(json.message).slideDown();
                                    }
                                })
                        }catch(e){
                            $("#userNameSearchErrorBox").text(e).slideDown();
                        }

                    })

                }else{
                    let participantName = currentBtnDOM.text();
                    let html =`
                        <div class="modal-box">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h3 class="modal-title">Remove the participant</h3>
                            </div>
                            <div class="modal-body">Do you want to remove the participant <b class="text-info">${participantName}</b>?</div>
                            <div class="modal-footer">
                                <button id="removeParticipantBtn" type="button" class="btn btn-danger"><div class="lds-dual-ring loadingIcon"></div>Remove</button>
                            </div>
                        </div>
                    `;

                    Swal.fire({
                        html:html,
                        width:640,
                        showConfirmButton: false,
                    })

                    $("#removeParticipantBtn").click(function(){
                        $("input[name=participant_user_id]").val(currentBtnDOM.attr('data-user-id'));
                        let url = "/restAPI/eventController.php?action=deleteParticipantByAdmin&dataType=json";
                        let options = {
                            method: "POST",
                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                            body: $("#participantsForm").serialize(),
                            credentials: 'same-origin',
                        };
                        fetch(url,options)
                            .then(response=>response.json())
                            .then(json=>{
                                if(json.code === 200){
                                    const {result} = json;
                                    currentBtnDOM.text("+").attr('data-user-id',0);
                                    Swal.close();
                                }else{
                                    alert(json.message)
                                }
                            })
                    })
                }

                $('.close').click(function(){
                    Swal.close();
                })

            })
        })
    }


    //add participant
    $("button[data-product-id]").click(function(){
        let html =`
        <div class="modal-box">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">ADD PRODUCTS TO MY QUOTATION</h3>
            </div>
            <div class="modal-body">
                <table class="table product-overview">
                    <thead>
                    <tr>
                        <th>Product info</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th style="text-align:center">Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td id="cartProductName"></td>
                        <td id="cartProductPrice"></td>
                        <td width="100">
                            <input id="cartProductPriceQuantity" type="number" min="1" class="form-control" value="1">
                        </td>
                        <td align="center" width="200"><h4 id="cartProductAmount" ></h4></td>
                    </tr>
                    </tbody>
                </table>
                <table class="table product-overview">
                    <tr>
                        <td width="150">Select a quotation</td>
                        <td id="selectQuotation"></td>
                    </tr>
                </table>
                </div>
                <div class="modal-footer">
                <div class="lds-dual-ring"></div>
                <button id="cartProductAddBtn" type="button" class="btn btn-danger"><div class="lds-dual-ring loadingIcon"></div>Add to quotation</button>
            </div>
        </div>
    `;

        Swal.fire({
            html:html,
            width:640,
            showConfirmButton: false,
        })

        let name = $(this).attr('data-product-name');
        let sku = $(this).attr('data-product-sku');
        let price = Number($(this).attr('data-product-price'));
        let productId = $(this).attr('data-product-id');
        let cartId = 0;
        //$("#cartModal").modal('show');

        $('.close').click(function(){
            Swal.close();
        })

        $('#selectQuotation').selectInput(
            `/restAPI/orderController.php?action=getMyCarts&dataType=json`,
            `/restAPI/orderController.php?action=addCart&dataType=json`,
            'Create a new quotation',
            (v)=>{cartId = v;}
        );

        $("#cartProductName").html(name);
        $("#cartProductPrice").html("$"+(price/100).toFixed(2));
        let quantity = 1;
        let amount = price * quantity;
        $("#cartProductAmount").html("$"+(amount/100).toFixed(2));
        $("#cartProductPriceQuantity").on("keyup change",function(e){
            quantity = e.target.value >= 1 ? e.target.value : 1;
            $("#cartProductAmount").html("$"+(price * quantity / 100).toFixed(2));
            $(this).val(quantity);
        }).click(function(){
            $(this).select();
        });
        let cartProductAddBtn = $("#cartProductAddBtn");
        let loadingIcon = cartProductAddBtn.find(".loadingIcon");
        cartProductAddBtn.click(function(){

            if(!cartId){
                showAlert('Please create/select a quotation!','error');
                return false;
            }

            cartProductAddBtn.attr('disabled',true);
            loadingIcon.css({'display':'inline-block'});
            let params = new URLSearchParams();
            params.append('order_id', cartId);
            params.append('product_id', productId);
            params.append('product_count', quantity);

            axios.post('/restAPI/orderController.php?action=modifyOrderProduct&dataType=json',params)
                .then(function (response) {
                    if(response.data.code == 200){
                        Swal.fire({
                            position: 'center',
                            type: 'success',
                            title:'Success',
                            text: response.data.message,
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }else if(response.data.message){
                        Swal.fire('Oops...', response.data.message, 'error');
                    }else{
                        Swal.fire('Oops...', 'There is an unknown error occur in the API', 'error');
                    }
                })
                .catch(function (error) {
                    Swal.fire('Oops...', 'There are some errors of API', 'error');
                })
                .then(function () {
                    // always executed
                    cartProductAddBtn.attr('disabled',false);
                    loadingIcon.hide();
                });

        })
    })


});
