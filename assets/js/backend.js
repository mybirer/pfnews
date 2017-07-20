$(function () {
    $('select[name="limit"]').on("change",function(){
        var hash = window.location.search;
        var route=window.location.origin+window.location.pathname;
        if(hash.length==0){
            route+="?limit="+encodeURIComponent($(this).val());
        }
        else{
            route+='?';
            var tt=hash.replace('?','').split("&");
            $.each(tt,function(i,t){
                var q=t.split("=");
                if(q[0]!="limit" && q[0]!="page"){
                    route+=t+"&";
                }
            });
            route+="limit="+encodeURIComponent($(this).val());
        }
        location.href=route;
    });
    $('#filters').on("submit",function(){
        var hash = window.location.search.replace('?','');
        var tt=hash.split("&");
        var routeArr=[];
        var filters=$('#filters').serialize();
        $.each(tt,function(i,t){
            var q=t.split("=");
            if(q[0]=="limit"){
                routeArr.push(t);
            }
        });
        routeArr.push(filters);
        var route=routeArr.join('&');
        location.href='?'+route;
        return false;
    });
    $('#detailed-filter-btn').on("click",function(){
        var is_detailed = $('.filter-panel:visible').length==0 ? 1 : 0;
        $('[name="is_detailed"]').val(is_detailed);
        $('.filter-panel').toggle();
        return false;
    });
    $('.has-link').on('click',function(){
        location.href='index.php?controller=forms&action=edit&id='+$(this).parent().data('id')
    });
    $('.delete-link').on('click',function(){
        if(confirm('This action cannot be undone. Do you want to proceed?')){
            return;
        }
        return false;
    });
    $('[data-toggle="toggle-checkboxs"]').on('click',function(){
        if($(this).hasClass('all-selected')){
            $($(this).data('target')).prop('checked',false);
            $(this).removeClass('all-selected');
        }
        else{
            $($(this).data('target')).prop('checked',true);
            $(this).addClass('all-selected');
        }
        return false;
    });

    $('a[data-toggle="change-order"]').on('click',function(event,target){
        var newOrderDir = $(event.currentTarget).hasClass('asc') ? 'desc' : 'asc';

        $('.live-label').removeClass('asc');
        $('.live-label').removeClass('desc');

        $(event.currentTarget).addClass(newOrderDir);
        var newOrderBy=$(event.currentTarget).data('order-by');


        var hash = window.location.search.replace('?','');
        var tt=hash.split("&");
        var routeArr=[];
        $.each(tt,function(i,t){
            var q=t.split("=");
            if(!(q[0]=="order_by" || q[0]=="order_dir")){
                routeArr.push(t);
            }
        });
        routeArr.push("order_by="+newOrderBy+"&order_dir="+newOrderDir);
        var route=routeArr.join('&');
        location.href='?'+route;
    });
});