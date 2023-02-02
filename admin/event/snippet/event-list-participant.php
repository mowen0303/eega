<?php
try {
    global $userModel;
    global $place_arr;
    $eventModel = new \model\EventModel();
    $eventId = (int) $_GET['eventId'];
    if ($eventId) {
        //修改
        $row =  $eventModel->getEvents([$eventId])[0];
        $place = $place_arr[$row['event_location_id']];
    }else{
        Helper::throwException(null,404);
    }
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>

<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">EVENT / PARTICIPANTS</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn();?>
    </label>
</div>
<!--header end-->

<div class="row">
    <div class="col-lg-12">
        <div class="white-box">
            <div class="">
                <h2 class="m-b-0 m-t-0"><?=$row['event_title']?></h2> <small class="text-muted db"><?=$row['event_date']?></small>
                <hr>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">

                        <h4 class="box-title m-t-40">COURSE information</h4>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td width="150">Course</td>
                                        <td> <?=$place->name?> </td>
                                    </tr>
                                    <?php
                                    if($place->red){
                                        echo "<tr>
                                                <td>Red</td>
                                                <td>Rating: {$place->red->rating} | Slope: {$place->red->slope} | Par: {$place->red->par} </td>
                                            </tr>";
                                    }
                                    if($place->green){
                                        echo "<tr>
                                                <td>Geeen</td>
                                                <td>Rating: {$place->green->rating} | Slope: {$place->green->slope} | Par: {$place->green->par} </td>
                                            </tr>";
                                    }
                                    if($place->white){
                                        echo "<tr>
                                                <td>White</td>
                                                <td>Rating: {$place->white->rating} | Slope: {$place->white->slope} | Par: {$place->white->par} </td>
                                            </tr>";
                                    }
                                    if($place->blue){
                                        echo "<tr>
                                                <td>Blue</td>
                                                <td>Rating: {$place->blue->rating} | Slope: {$place->blue->slope} | Par: {$place->blue->par} </td>
                                            </tr>";
                                    }
                                    if($place->black){
                                        echo "<tr>
                                                <td>Black</td>
                                                <td>Rating: {$place->black->rating} | Slope: {$place->black->slope} | Par: {$place->black->par} </td>
                                            </tr>";
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>


                        <h4 class="box-title m-t-40">Description</h4>
                        <div><pre style="font-family: 'Rubik', sans-serif; font-size: 14px; color: #797979; border: none; padding: 0; line-height: 1.5em"><?=$row['event_description']?></pre></div>

                        <h4 class="box-title m-t-40">Participants</h4>
                        <div id="participantsWrap" data-event-id="<?=$eventId?>" data-max="<?=$row['event_max_participant']?>">
                            <form id="participantsForm" class="hidden">
                                <input id="deviceId" type="hidden" name="participant_event_id" value="<?=$eventId?>">
                                <input id="userId" type="hidden" name="participant_user_id" value="">
                                <input id="userId" type="hidden" name="participant_index" value="">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>