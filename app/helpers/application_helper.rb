# lol

module ApplicationHelper

  def utnif_type(type)
    case type.to_sym
    when :error
      'alert-danger'
    when :success
      'alert-success'
    when :warning
      'alert-warning'
    else
      'alert-info'
    end
  end

  def unread_blog_posts
    if current_user
      c = NewsPost.where("created_at > ? and published = true", current_user.last_sign_in_at).count
      c > 0 ? c : ""
    end
  end

  def carriers 
    [["AT&T","mms.att.net"],["T-Mobile","tmomail.net"],["Sprint (PCS)","messaging.sprintpcs.com"],["Verizon/Tracfone Prepaid","vtext.com"],["Google Fi","msg.fi.google.com"],["Ting Mobile","message.ting.com"],["Cricket/AIO","mms.cricketwireless.net"],["Virgin Mobile","vmobl.com"],["MetroPCS","mymetropcs.com"],["Sprint (Nextel)","page.nextel.com"],["AT&T Enterprise Paging","page.att.net"],["Alaska Communications","msg.acsalaska.com"],["Alltel","message.alltel.com"],["Boost Mobile","myboostmobile.com"],["Cellular One","mobile.celloneusa.com"],["Centennial Wireless","cwemail.com"],["Cingular/GoPhone/7-11 Speakout","cingularme.com"],["Cricket (Old/Sprint)","mms.mycricket.com"],["General Communications","msg.gci.net"],["Globalstar","msg.globalstarusa.com"],["Helio","myhelio.com"],["Illinois Valley Cellular","ivctext.com"],["Qwest","qwestmp.com"],["Thumb Cellular","sms.thumbcellular.com"],["US Cellular","email.uscc.net"],["Unicel","utext.com"]]
  end
  def states 
    [ ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY'] 
    ]
  end

  def utnif_modal(modal_title = 'modal-title',&block)
    render(partial: 'layouts/modal', locals:{modal_title: modal_title, block: block})
  end

end
