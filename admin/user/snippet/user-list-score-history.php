<?php
try {
    global $userModel;
    global $place_arr;
    $userId = Helper::get("uid","user id is required");
    $eventModel = new \model\EventModel();
    $rankHistoryArr = $eventModel->getAllParticipants($userId);
    $rankValue = 1;
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">EVENT / SCORE </h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(2);?>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">SCORE HISTORY - LAST 20 GAMES</h3>
                </div>
            </div>
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="100" class="p-l-20">#</th>
                            <th width="150">AVATAR</th>
                            <th width="150">Name</th>
                            <th>COURSE</th>
                            <th>T TYPE (S/R/P)</th>
                            <th>GROSS SCORE</th>
                            <th></th>
                            <th>DIFFERENTIAL</th>
                            <th>DATE</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($rankHistoryArr as $row) {
                            $place = $place_arr[$row['event_location_id']];
                            ?>
                            <tr>
                                <td class="p-l-30"><?=$rankValue++?></td>
                                <td><div class="avatar avatar-40" style="background-image: url('<?=$row['user_avatar']?>')"></td>
                                <td><?=$row['user_first_name'] ?> <?=$row['user_last_name'] ?></td>
                                <td><?=$place->name?></td>
                                <td><span class="participantT"><?=$row['participant_t']?></span> (<span class="tR"><?=$place->{$row['participant_t']}->rating ?></span>/<span class="tS"><?=$place->{$row['participant_t']}->slope?></span>/<span class="tP"><?=$place->{$row['participant_t']}->par?></span>)</td>
                                <td><?=$row['participant_score'] ?></td>
                                <td><?php
                                    if($row['rank_history_is_used_for_calculate']==1){
                                        echo '<span class="label label-success">Valid</span>';
                                    }
                                    ?></td>
                                <td><?=$row['participant_handicap_differential'] ?></td>
                                <td><?=$row['participant_date'] ?></td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                        </tbody>
                    </table>
                </div>
        </div>
    </div>
</div>

