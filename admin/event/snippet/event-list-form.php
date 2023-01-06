<?php
try {
    global $userModel;
    global $place_arr;
    $eventModel = new \model\EventModel();
    $eventId = (int) $_GET['eventId'];
    if ($eventId) {
        //修改
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $row =  $eventModel->getEvents([$eventId])[0];
    }else{
        $userModel->isCurrentUserHasAuthority('EVENT', 'ADD') or Helper::throwException(null, 403);
    }
    $flag = $row?'Edit':'Add';
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">EVENT / <?=$flag?></h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn();?>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-info">
            <div class="panel-heading"><?=$flag?> Event</div>
            <div class="panel-wrapper collapse in">
                <div class="panel-body">
                    <form class="form-horizontal" action="/restAPI/eventController.php?action=modifyEvent" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="event_id" value="<?=$row['event_id']?>">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Title *</label>
                            <div class="col-sm-6">
                                <input type="text" name="event_title" value="<?php echo $row['event_title']?>" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Location *</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="event_location_id" data-defvalue="<?php echo $row['event_location_id']?>">
                                    <?php
                                    foreach ($place_arr as $x) {
                                    ?>
                                    <option value="<?=$x->id?>"><?=$x->id?> - <?=$x->name?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Maximum participants  *</label>
                            <div class="col-sm-2">
                                <input type="number" name="event_max_participant" value="<?php echo $row['event_max_participant']?>" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Date *</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" name="event_date" value="<?php echo $row['event_date']?>" class="form-control complex-colorpicker" id="datepicker-autoclose" placeholder="yyyy-mm-dd"> <span class="input-group-addon"><i class="icon-calender"></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Type *</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="event_type" data-defvalue="<?php echo $row['event_type']?>">
                                    <option value="week">Weekly</option>
                                    <option value="month">Monthly</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Description</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" name="event_description" spellcheck="false"><?php echo $row['event_description']?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-info waves-effect waves-light m-t-10">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
