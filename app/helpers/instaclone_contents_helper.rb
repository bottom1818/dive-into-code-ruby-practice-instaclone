module InstacloneContentsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_instaclone_contents_path
    elsif action_name == 'edit'
      instaclone_content_params
      instaclone_contents_path
    end
  end
end
