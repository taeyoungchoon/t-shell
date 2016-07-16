# aix
#
# http://www.unixmantra.com/2013/09/aix-os-errpt-error-output-explained.html
# 0930152913 : (09 = Month, 30 = Day, 15 = Hour, 29 = Minutes, 13 = Year)k
# https://www.ibm.com/developerworks/community/blogs/brian/entry/script_to_show_recent_error_report_errpt_entries_on_aix?lang=en
#
errpt | head -10
# errpt -aD | more
# desc : cached data will be lost if controller fails
# cause : user disabled cache mirroring for this lun
# recommended action : enable cache mirroring
