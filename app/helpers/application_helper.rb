# frozen_string_literal: true

module ApplicationHelper
  def link_to_sign_out
    link_to t('defaults.sign_out'), destroy_user_session_path, method: :delete
  end
end
