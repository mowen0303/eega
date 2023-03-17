<?php
try {
    global $userModel;
    global $place_arr;
    $rankModel = new \model\RankModel();
    $rankArr = $rankModel->getRank();
    $rankValue = 1;
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">RANK</h4>
    </div>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">RANK LIST</h3>
                </div>
            </div>
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="100" class="p-l-20">Rank</th>
                            <th width="150">AVATAR</th>
                            <th width="300">Name</th>
                            <th>HANDICAP INDEX</th>
                            <th>SCORE COUNT</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($rankArr as $row) {
                            ?>
                            <tr>
                                <td class="p-l-30"><?=$rankValue++?></td>
                                <td><div class="avatar avatar-40" style="background-image: url('<?=$row['user_avatar']?>')"></td>
                                <td><?=$row['user_first_name'] ?> <?=$row['user_last_name'] ?></td>
                                <td><a href="/admin/rank/index.php?s=rank-list-history&userId=<?=$row['rank_user_id']?>"><?=$row['rank_handicap_index'] ?></a></td>
                                <td><?=$row['rank_history_count'] ?></td>
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