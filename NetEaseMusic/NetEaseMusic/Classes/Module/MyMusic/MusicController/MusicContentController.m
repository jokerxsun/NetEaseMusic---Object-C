//
//  MusicContentController.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/23.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "MusicContentController.h"
#import "MusicSectionHeader.h"
#import "MusicChanelCell.h"

@interface MusicContentController ()

@end

@implementation MusicContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configTableView];
}

- (void)configTableView
{
    [self.tableView setSeparatorColor:SXHEXCOLOR(0xefeff4)];
    
    self.tableView.sectionHeaderHeight = 20;
    
    self.tableView.rowHeight = 60;
    
    self.tableView.backgroundColor = SXHEXCOLOR(0xefeff4);
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MusicSectionHeader class]) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([MusicSectionHeader class])];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    
    return 20;
}

#pragma mark ---- delegate

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
   MusicSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([MusicSectionHeader class])];
    header.section = section;
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MusicChanelCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MusicChanelCell class])];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
