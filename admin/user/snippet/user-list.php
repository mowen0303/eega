<?php
try {
    global $userModel;
    $userArr = $userModel->getUsers([0],$_GET);
    $userCategoryArr = $userModel->getUserCategories();
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">User</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(1);?>
        <a href="/admin/user/index.php?s=user-list-type-change-form" class="btn btn-danger pull-right m-l-10"> Update User Type</a>
        <a href="/admin/user/index.php?s=user-list-form" class="btn btn-danger pull-right"><i class="fas fa-plus-circle"></i>  Add User</a>
    </label>
</div>

<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <h3 class="box-title">Search User</h3>
            <form class="" action="/admin/user/index.php" method="get">
                <input type="hidden" name="s" value="user-list">
                <input type="hidden" name="type" value="<?=$_GET['type']?>">
                <div class="row">
                    <div class="<?=$_GET['searchValue']?'col-sm-8':'col-sm-10'?>">
                        <input class="form-control" placeholder="Username" type="text" name="searchValue" value="<?=$_GET['searchValue']?>">
                    </div>
                    <div class="col-sm-2">
                        <button class="btn btn-block btn-info waves-effect waves-light" type="submit">Search</button>
                    </div>
                    <?php
                    if($_GET['searchValue']){
                    ?>
                        <div class="col-sm-2">
                            <a href="/admin/user/index.php?s=user-list&type=all" class="btn btn-block btn-danger waves-effect waves-light" type="submit">Clear</a>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">User List</h3>
                </div>
            </div>
            <div class="row m-b-20">
                <form action="/admin/user/index.php" method="get">
                    <input type="hidden" name="s" value="user-list">
                    <div class="col-sm-12 p-l-0 p-r-0">
                        <div class="col-sm-10">
                            <select name="userCategoryId" class="form-control" data-defvalue="<?=$_GET['userCategoryId']?>">
                                <option value="">All</option>
                                <?php
                                foreach ($userCategoryArr as $userCategory){
                                    echo "<option value=\"{$userCategory['user_category_id']}\">Level {$userCategory['user_category_level']} - {$userCategory['user_category_title']}</option>";
                                }
                                ?>
                            </select>
                            <span class="help-block"><small>Filter by user group</small></span>
                        </div>
                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-block btn-info waves-effect waves-light">Filter</button>
                        </div>
                    </div>
                </form>
            </div>
            <form action="/restAPI/userController.php?action=deleteUserByIds" method="post">
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="21px"><input id="cBoxAll" type="checkbox"></th>
                            <th>#</th>
                            <th>AVATAR</th>
                            <th>Username</th>
                            <th>First name</th>
                            <th><a <?=$userModel->getUserListOrderUrl('lastName')?>>Last name</a></th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Birthday</th>
                            <th>GROUP</th>
                            <th><a <?=$userModel->getUserListOrderUrl('lastLoginTime')?>>LAST LOGIN TIME</a></th>
                            <th>SCORE HISTORY</th>
                            <th width="70"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($userArr as $row) {
                        ?>
                            <tr>
                                <td>
                                    <input type="checkbox" class="cBox" name="id[]" value="<?=$row['user_id']?>">
                                </td>
                                <td><?=$row['user_id']?></td>
                                <td><div class="avatar avatar-40" style="background-image: url('<?=$row['user_avatar']?>')"></td>
                                <td><a data-hl-search href="/admin/user/index.php?s=user-list-profile&userId=<?=$row['user_id']?>"><?=$row['user_name']?></a></td>
                                <td data-hl-search><?=$row['user_first_name']?></td>
                                <td data-hl-search><?=$row['user_last_name'] ?></td>
                                <td><?=$row['user_email']?></td>
                                <td><?=$row['user_phone']?></td>
                                <td><?=$row['user_month']?>-<?=$row['user_day']?></td>
                                <td><span class="label label-success"><?=$row['user_category_title']?></span></td>
                                <td data-hl-orderby="lastLoginTime"><?=$row['user_last_login_time']?></td>
                                <td>
                                    <a href="/admin/user/index.php?s=user-list-score-history&uid=<?=$row['user_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title=""><i class="ti-flag-alt"></i></a>
                                </td>
                                <td>
                                    <a href="/admin/user/index.php?s=user-list-form&uid=<?=$row['user_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Edit"><i class="ti-marker-alt"></i></a>
                                    <a href="/admin/user/index.php?s=user-list-pwd-form&uid=<?=$row['user_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Change Password"><i class="ti-key"></i></a>
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