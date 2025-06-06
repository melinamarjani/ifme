# frozen_string_literal: true
feature 'UserUpdatesGroups', type: :feature, js: true do
  scenario 'leader adds another leader' do
    leader = create(:user1)
    login_as(leader)
    other_user = create(:user2)
    group = create(:group)
    create(:group_member, user: leader, group: group, leader: true)
    create(:group_member, user: other_user, group: group, leader: false)

    visit edit_group_path(group)
    check "group_leader_#{other_user.id}"
    click_button 'Submit'

    expect(page).to have_current_path(groups_path)
    expect(group.reload.leaders).to include(other_user)
  end

  scenario 'leader removes another leader' do
    leader = create(:user1)
    login_as(leader)
    other_leader = create(:user2)
    group = create(:group)
    create(:group_member, user: leader, group: group, leader: true)
    create(:group_member, user: other_leader, group: group, leader: true)

    visit edit_group_path(group)
    uncheck "group_leader_#{other_leader.id}"
    click_button 'Submit'

    expect(page).to have_current_path(groups_path)
    expect(group.reload.leaders).to eq [leader]
  end
end