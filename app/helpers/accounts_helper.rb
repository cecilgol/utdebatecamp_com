module AccountsHelper

  def create_account_generic_form(f)
    render partial: 'generic_form', locals: { f: f }
  end

end
