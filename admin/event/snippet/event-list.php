<?php
try {
    global $userModel;
    global $place_arr;
    $eventModel = new \model\EventModel();
    $eventArr = $eventModel->getEvents([0]);
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">Event</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(1);?>
        <a href="/admin/event/index.php?s=event-list-form" class="btn btn-danger pull-right"><i class="fas fa-plus-circle"></i>  Add Event</a>
    </label>
</div>

<!--header end-->

<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">Event List</h3>
                </div>
            </div>
            <form action="/restAPI/userController.php?action=deleteUserByIds" method="post">
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="21px"><input id="cBoxAll" type="checkbox"></th>
                            <th>Title</th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Location</th>
                            <th>Maximum participants</th>
                            <th width="140"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($eventArr as $row) {
                        ?>
                            <tr>
                                <td>
                                    <input type="checkbox" class="cBox" name="id[]" value="<?=$row['event_id']?>">
                                </td>
                                <td><?=$row['event_title']?></td>
                                <td><?=$row['event_date']?></td>
                                <td><?=$row['event_type']?></td>
                                <td><?=$place_arr[$row['event_location_id']]->name?></td>
                                <td><?=$row['event_max_participant']?></td>
                                <td>
                                    <a href="/admin/event/index.php?s=event-list-form&eventId=<?=$row['event_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Edit event"><i class="ti-marker-alt"></i></a>
                                    <a href="/admin/event/index.php?s=event-list-participant&eventId=<?=$row['event_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Manage participant"><i class="ti-user"></i></a>
                                    <a href="/admin/event/index.php?s=event-list-review-form&eventId=<?=$row['event_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Edit review"><i class="ti-comment-alt"></i></a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-8"><?=$userModel->echoPageList()?></div>
                    <div class="col-sm-4 text-right">
                        <button id="deleteBtn" style="display: none" type="submit" class="btn btn-info waves-effect waves-light m-t-10" onclick="return confirm('Are you sure to delete?')">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>