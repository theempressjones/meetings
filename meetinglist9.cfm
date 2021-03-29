
<META name="keyword" content="Alcoholics Anonymous AA meetings recovery addiction drinking">                   
          
 
<cfset today = #dayofweek(now())#>

<cfif IsDefined("newtoday")>
<cfelse>
	<cfset newtoday = 0>
	<!---<cfset newtoday = #today#>--->
</cfif>

<cfif IsDefined("newcity")>
<cfelse>
	<cfset newcity = "allcities">
</cfif>

<cfif IsDefined("newtype")>
<cfelse>
	<cfset newtype = "All Meetings">
</cfif>

<cfif newtype is "All Meetings">
<cfelse>
	<cfquery name="gettype" datasource="#attributes.dsn#">
    	SELECT *
        FROM topic
        WHERE meetingcode = '#newtype#'
    </cfquery>
</cfif>
<cfif IsDefined("newpeople")>
<cfelse>
	<cfset newpeople = "all people">
</cfif>

<cfif newtype is "all people">
<cfelse>
	<cfquery name="getpeople" datasource="#attributes.dsn#">
    	SELECT *
        FROM people
        WHERE code = '#newpeople#'
    </cfquery>
</cfif>
<cfif IsDefined("newtime")>
<cfelse>
	<cfset newtime = "alltime">
</cfif>

<cfif newtime is "alltime"><cfset meettime = "All Times"></cfif>
<cfif newtime is "nightnight"><cfset meettime = "Night (10PM to 6AM)"></cfif>
<cfif newtime is "breakfast"><cfset meettime = "Morning (6AM to Noon)"></cfif>
<cfif newtime is "noon"><cfset meettime = "Noon"></cfif>
<cfif newtime is "afterlunch"><cfset meettime = "Afternoon (1PM to 6PM)"></cfif>
<cfif newtime is "dinner"><cfset meettime = "Evening (6PM to 10PM)"></cfif>

<cfquery name="getdays" datasource="#attributes.dsn#">
	SELECT *
    FROM days
    WHERE number = #newtoday#
</cfquery>
<cfquery name="dayday" datasource="#attributes.dsn#">
	SELECT *
    FROM days
</cfquery>

<cfquery name="citycity" datasource="#attributes.dsn#">
	SELECT DISTINCT groupcity
    FROM groupinfo
    ORDER BY groupcity
</cfquery>

<cfinclude template="../../headernew.cfm">
<center>
<cfoutput>
        	<cfoutput><font size="1" color="white">
            kansas city Alcoholics Anonymous AA drinking addiction recovery help
            </font></cfoutput>
<table border="0">            
	<tr>
    	<td colspan="20" align="center">
        	<b>All meetings are for ALCOHOLICS ONLY unless otherwise indicated with an <b>O</b> and all groups are NON-SMOKING unless otherwise indicated</b>
        </td>
    </tr>
	<tr>
    	<td align="right" nowrap="nowrap"><b>O</b></td>
        <td nowrap="nowrap"><b>Open - All Welcome</b></td>
    	<td align="right"><b>BB</b></td>
        <td  nowrap="nowrap">Big Book</td>
    	<td align="right"><b>S</b></td>
        <td nowrap="nowrap">Steps</td>
    	<td align="right"><b>SHP</b></td>
        <td nowrap="nowrap">Sponsorship</td>
    	<td align="right"><b>P</b></td>
        <td nowrap="nowrap">Promises</td>
    	<td align="right"><b>CL</b></td>
        <td nowrap="nowrap">Candelight</td>
    	<td align="right"><b>Med</b></td>
        <td nowrap="nowrap">Meditation</td>
    	<td align="right"><b>W</b></td>
        <td nowrap="nowrap">Women</td>
    	<td align="right"><b>LGBT</b></td>
        <td nowrap="nowrap">Gay/ Gay Friendly</td>
    </tr>
    <tr>
    	<td align="right"><b>ASL</b></td>
        <td nowrap="nowrap">ASL Interpreter</td>
    	<td align="right"><b>BBS</b></td>
        <td  nowrap="nowrap">Big Book & Steps</td>
    	<td align="right"><b>TRD</b></td>
        <td nowrap="nowrap">Traditions</td>
    	<td align="right"><b>GPV</b></td>
        <td nowrap="nowrap">Grapevine</td>
    	<td align="right"><b>SPRT</b></td>
        <td nowrap="nowrap">Spirituality</td>
    	<td align="right"><b>HIST</b></td>
        <td nowrap="nowrap">AA History</td>
    	<td align="right"><b>LIT</b></td>
        <td nowrap="nowrap">Literature</td>
    	<td align="right"><b>M</b></td>
        <td nowrap="nowrap">Men</td>
    	<td align="right"><b>YP</b></td>
        <td nowrap="nowrap">Young People</td>
    </tr>
    <tr>
    	<td align="right"><b>BTH</b></td>
        <td  nowrap="nowrap">Sobriety Anniversary</td>
    	<td align="right"><b>ST</b></td>
        <td nowrap="nowrap">Steps & Traditions</td>
    	<td align="right"><b>CPT</b></td>
        <td nowrap="nowrap">Concepts</td>
    	<td align="right"><b>New</b></td>
        <td nowrap="nowrap">Newcomers</td>
    	<td align="right"><b>SPK</b></td>
        <td nowrap="nowrap">Speaker</td>
    	<td align="right"><b>TAPE</b></td>
        <td nowrap="nowrap">Tape Discussion</td>
    	<td align="right"><b>FILM</b></td>
        <td nowrap="nowrap">Films</td>
    	<td align="right"><b>CPL</b></td>
        <td nowrap="nowrap">Couples</td>
    	<td align="right"><b>NAm</b></td>
        <td nowrap="nowrap">Native American</td>
    </tr>
</table>
<cfoutput><font size="1" color="white">
            kansas city Alcoholics Anonymous AA drinking addiction recovery help
            </font></cfoutput><br />
<table cellpadding="0" cellspacing="0">
<cfform name="getnewstuff" action="meetinglist9.cfm" method="post">
	<tr>
    	<td colspan="1">
        	&nbsp;<br>   	
        </td>
    	<td colspan="5" align="left">
        	<font style="font-size:22px; color:black;">
            If you would like to attend a meeting of Alcoholics Anonymous you are welcome to attend any OPEN meeting.<br />
            Open  meetings  are  available  to  anyone  interested  in Alcoholics Anonymous&acute; program of recovery from alcoholism.<br />
            Nonalcoholics  may  attend  open  meetings as observers.   <a href="meetinglist10.cfm">CLICK HERE For a list of just OPEN meetings.</a><br /><br />
            </font>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <font color="red" size="5">Meetings that are suspended or relocated will be noted in red</font><br /><br />
            
            
            <font size="5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Some groups have temporarily closed but are hosting online meetings<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
            
            <font style="font-size:22px; color:blue;"><a href="meetinglist11.cfm">CLICK HERE For a list of only Online and Phone and Relocated meetings.</a></font>
        </td>
    	<td width="10%">
        	&nbsp;<br>   	
        </td>
    </tr>
	<tr>
    	<td width="10%">
        	&nbsp;<br>   	
        </td>
       <td align="center" colspan="1" valign="top" style="width:190px" >  
    		<cfselect size="1" name="newtime" onChange="form.submit();"
                style="width: 190px; height: 48px; font-size:24px; text-align:center;">
				<option value="alltime" <cfif newtime is "alltime">selected</cfif>>All Times</option>
				<option value="nightnight" <cfif newtime is "nightnight">selected</cfif>>Night (10PM to 6AM)</option>
				<option value="breakfast" <cfif newtime is "breakfast">selected</cfif>>Morning (6AM to Noon)</option>
				<option value="noon" <cfif newtime is "noon">selected</cfif>>Noon</option>
				<option value="afterlunch" <cfif newtime is "afterlunch">selected</cfif>>Afternoon (1PM to 6PM)</option>
				<option value="dinner" <cfif newtime is "dinner">selected</cfif>>Evening (6PM to 10PM)</option>
		  	</cfselect>
        </td>
        <td align="center" style="width:190px">
           <cfselect size="1" name="newtoday" onChange="form.submit();"
                style="width: 190px; height: 48px; font-size:24px; text-align:center;">
                <option value="0" <cfif newtoday is 0>selected</cfif>>All Days</option>
                <option value="1" <cfif newtoday is 1>selected</cfif> >Sunday</option>
                <option value="2" <cfif newtoday is 2>selected</cfif> >Monday</option>
                <option value="3" <cfif newtoday is 3>selected</cfif> >Tuesday</option>
                <option value="4" <cfif newtoday is 4>selected</cfif> >Wednesday</option>
                <option value="5" <cfif newtoday is 5>selected</cfif> >Thursday</option>
                <option value="6" <cfif newtoday is 6>selected</cfif> >Friday</option>
                <option value="7" <cfif newtoday is 7>selected</cfif> >Saturday</option>
           </cfselect>
        </td>
        <td align="center" style="width:190px">
		<cfif newcity is "allcities">
            <cfselect
            	name="newcity" onChange="form.submit();"
        		size="1"
            	value="groupcity"
	            query="citycity"
    	        display="groupcity"
                style="width: 190px; height: 48px; font-size:24px; text-align:center;">
                <option value="allcities" selected="selected">All Cities</option>
		   </cfselect>
        <cfelse>
        	<cfselect
            	name="newcity" onChange="form.submit();"
        		size="1"
            	value="groupcity"
	            query="citycity"
    	        display="groupcity"
                selected="#newcity#"
                style="width: 190px; height: 48px; font-size:24px; text-align:center;">
                <option value="allcities">All Cities</option>
		   </cfselect>
        </cfif>
        </td>
        <td align="center" style="width:225px">
           <cfselect size="1" name="newtype" onChange="form.submit();"
                style="width: 225px; height: 48px; font-size:24px; text-align:center;">
                <option value="All Meetings" <cfif newtype is "All Meetings">selected</cfif>>All Meeting Types</option>
                <option value="bb" <cfif newtype is "bb">selected</cfif>>Big Book</option>
                <option value="bbs" <cfif newtype is "bbs">selected</cfif>>Big Book & Steps</option>
                <option value="bbst" <cfif newtype is "bbst">selected</cfif>>Big Book - Steps - Traditions</option>
                <option value="cl" <cfif newtype is "cl">selected</cfif>>Candelight</option>
                <option value="cpt" <cfif newtype is "cpt">selected</cfif>>Concepts</option>
                <option value="cpl" <cfif newtype is "cpl">selected</cfif>>Couples</option>
                <option value="film" <cfif newtype is "film">selected</cfif>>Films</option>
                <option value="gpv" <cfif newtype is "gpv">selected</cfif>>Grapevine</option>
                <option value="hist" <cfif newtype is "hist">selected</cfif>>History of AA</option>
                <option value="lit" <cfif newtype is "lit">selected</cfif>>Literature</option>
                <option value="med" <cfif newtype is "med">selected</cfif>>Meditation</option>
                <option value="new" <cfif newtype is "new">selected</cfif>>Newcomers</option>
                <option value="bth" <cfif newtype is "bth">selected</cfif>>Sobriety Anniversary</option>
                <option value="spk" <cfif newtype is "spk">selected</cfif>>Speaker</option>
                <option value="sprt" <cfif newtype is "sprt">selected</cfif>>Spirituality</option>
                <option value="s" <cfif newtype is "s">selected</cfif>>Steps</option>
                <option value="st" <cfif newtype is "st">selected</cfif>>Steps & Traditions</option>
                <option value="tape" <cfif newtype is "tape">selected</cfif>>Tape Dicussion</option>
                <option value="trd" <cfif newtype is "trd">selected</cfif>>Traditions</option>
                <option value="24h" <cfif newtype is "24h">selected</cfif>>24 Hour Book</option>
           </cfselect>
       </td>
        <td align="center" style="width:275px">
           <cfselect size="1" name="newpeople" onChange="form.submit();"
                style="width: 275px; height: 48px; font-size:24px; text-align:center;">
                <option value="all people" <cfif newpeople is "all people">selected</cfif>>Attended by Everyone</option>
                <option value="child" <cfif newpeople is "child">selected</cfif>>Child Friendly</option>
                <option value="hcp" <cfif newpeople is "hcp">selected</cfif>>Health Care Professionals</option>
                <option value="df" <cfif newpeople is "df">selected</cfif>>Hearing Impaired</option>
                <option value="lgbt" <cfif newpeople is "lgbt">selected</cfif>>LGBT</option>
                <option value="m" <cfif newpeople is "m">selected</cfif>>Men</option>
                <option value="nsm" <cfif newpeople is "nam">selected</cfif>>Native American</option>
                <option value="smoke" <cfif newpeople is "smoke">selected</cfif>>Smoking Allowed</option>
                <option value="spn" <cfif newpeople is "spn">selected</cfif>>Spanish</option>
                <option value="spk" <cfif newpeople is "spk">selected</cfif>>Speaker</option>
                <option value="chair" <cfif newpeople is "chair">selected</cfif>>Wheelchair Accessible</option>
                <option value="w" <cfif newpeople is "w">selected</cfif>>Women</option>
                <option value="yp" <cfif newpeople is "yp">selected</cfif>>Young People</option>
           </cfselect>
       </td>
    	<td width="10%">
        	&nbsp;<br>   
        </td>
	</tr>
    <tr>
    	<td colspan="6" align="center">&nbsp;
        	
        </td>
    </tr>
    </cfform>
</table>	
</cfoutput>

<table border="0" cellspacing="0" width="95%">
<cfoutput>
	<tr>
        <td colspan="7" align="center">
			<font size="7">
            	<br />
            	<b>
				<cfif meettime is "All Times" AND newcity is "allcities" AND newtoday eq 0 AND newtype is "All Meetings" AND newpeople is "all people">
                All Meetings
                <cfelse>
					<cfif newpeople eq 'spn'>Spanish Speaking
            			<cfelseif newpeople eq 'w'>Women's
	 	           		<cfelseif newpeople eq 'm'>Men's
         		   		<cfelseif newpeople eq 'yp'>Young People
            			<cfelseif newpeople eq 'nam'>Native American
            			<cfelseif newpeople eq 'lgbt'>LGBT
            			<cfelseif newpeople eq 'chair'>Wheelchair Accessible
	            		<cfelseif newpeople eq 'child'>Child Friendly
    	        		<cfelseif newpeople eq 'smoke'>Smoking Allowed
        			</cfif>
					<cfif newtype is "All Meetings">Meetings<cfelse>#gettype.meetingtype# meetings</cfif>
					<cfif meettime is "All Times"><cfelseif meettime is "noon" OR meettime is "night"> at #meettime#<cfelse>in the #meettime#</cfif>
                	<cfif newtoday neq 0>on #getdays.day#s</cfif>
                	<cfif newcity is "allcities"><cfelse>in #newcity#</cfif>
                </cfif>
                </b>
                <br />
            </font>
        </td>
    </tr>
		<cfquery name="meetlist" datasource="#attributes.dsn#">
               	SELECT *
                FROM allmeetlist
                WHERE 1 = 1
					<cfif newtoday neq 0>
                    	AND day = #newtoday#
                    </cfif>
                    <cfif newcity neq "allcities">
                    	AND groupcity = '#newcity#'
                    </cfif>
                    
                    <cfif newtype neq "All Meetings">
                    	AND topic = '#newtype#'
                    </cfif>
                    
                    <cfif newpeople is 'chair'>
                    	AND groupinfo.wheelchair = yes
                    <cfelseif newpeople is "child">
                    	AND (childfriend = yes OR childcare = yes)
                    <cfelseif newpeople is "smoke">
                    	AND smoking = yes
                    <cfelseif newpeople neq "all people">
                    	AND (people = '#newpeople#' OR attended = '#newpeople#')
                    </cfif>
                    
					<cfif newtime is "nightnight">
                    	AND time2 BETWEEN 0.9166667 AND 0.9999999
            		</cfif>
            		<cfif newtime is "breakfast">
                    	AND time2 BETWEEN 0.2499999 AND 0.4999999
            		</cfif>
            		<cfif newtime is "noon">
                    	AND time2 BETWEEN 0.5 AND 0.5416667
            		</cfif>
		            <cfif newtime is "afterlunch">
                    	AND time2 BETWEEN 0.54097222 AND 0.7499999
        		    </cfif>
		            <cfif newtime is "dinner">
                    	AND time2 BETWEEN 0.7499999 AND 0.9155555
        		    </cfif>
                    	ORDER BY groupcity, day, time2, groupname, online
            </cfquery>
    <tr>
    	<td colspan="7">
        	<hr />
        </td>
    </tr>
    <cfset xx = 1>    
    <cfloop query="meetlist">
    <tr>
    	<td align="right" nowrap="nowrap" width="75" valign="top">
        	<font color="darkgreen">#timeformat(time1, "h:mm TT")#</font>
        </td>
        <td align="left" nowrap="nowrap" width="75" valign="top">
        	<cfif newtoday eq 0>
            <font color="darkgreen">&nbsp;&nbsp;#dayofweekasstring(day)#</font>
            </cfif>
        </td>
        <td align="left" nowrap="nowrap" width="75" valign="top">
        	<font color="darkgreen">&nbsp;&nbsp;<cfif open is "open">#open#</cfif></font>
        </td>
        <td align="left" nowrap="nowrap" width="300" valign="top">
            <font color="darkgreen" size="5"><b>#groupname#</b></font><br /><br />
            <font color="green">
			<cfif conference_url neq "">
            	<i class="fas fa-video"></i>&nbsp;&nbsp;
                <a href="#conference_url#" target="_blank">Join an Online Meeting</a><br /><br />
            <cfelseif conference_url eq "" AND conference_phone neq "">
            	<i class="fas fa-phone-volume"></i>&nbsp;&nbsp;
            	<a href="tel:#conference_phone#">Join by Phone</a><br /><br />
            </cfif>
			</font>
            <cfif meetnotes neq "">Access Code #meetnotes#</cfif>
			<cfif suspended neq "yes"><font color="darkgreen" size="6"><i class="fas fa-users"></i></font>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="https://www.google.com/maps/place/#meetlist.groupaddress#,+#meetlist.groupcity#,+#meetlist.groupstate#+#meetlist.groupzip#" target="new">Get Map to Group</a><br /></cfif>
        </td>
        <td align="left" width="500" valign="top" nowrap="nowrap">
        	<font color="darkgreen">#groupaddress#&nbsp; #groupcity#
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <font color="red"><cfif suspended eq "yes" OR groupname contains 'suspended'>This location temporarily closed&nbsp;</cfif></font><br />
            #grouplocation#<br />
            #groupdirections#<br />
            #groupnote1#</font>
        </td>
        <td align="left" nowrap="nowrap" width="200" valign="top">
        	<cfquery name="gettopic" datasource="#attributes.dsn#">
            	SELECT *
                FROM topic
                WHERE meetingcode = '#topic#'
             </cfquery>
        	 <font color="darkgreen">#gettopic.meetingtype#</font>
        </td>
        <td align="left" nowrap="nowrap" width="75" valign="top">
        	<font color="darkgreen">
			<cfif people eq ' '>
			<cfelseif people eq 'spn'>Spanish
            <cfelseif people eq 'w'>Women Only
            <cfelseif people eq 'm'>Men Only
            <cfelseif people eq 'yp'>Young People
            <cfelseif people eq 'name'>Native American
            <cfelse><i>#people#</i>
            </cfif>
        	<cfif wheelchair eq 'yes'> Wheelchair Accessible
			<cfelseif childfriend eq 'yes'> Child Friendly
            <cfelseif smoking eq 'yes'> Smoking Allowed
        	</cfif>
            </font>
        </td>
    </tr>
    <tr>
    	<td colspan="7">
        <hr />        	        	
        </td>
    </tr>
    <cfset xx = xx+1>     
    </cfloop>
</cfoutput>
</table>	
        	<br /><cfoutput><font size="1" color="white">
            kansas city Alcoholics Anonymous AA drinking addiction recovery help<br />
            kansas city Alcoholics Anonymous AA drinking addiction recovery help<br />
            kansas city Alcoholics Anonymous AA drinking addiction recovery help
            </font></cfoutput><br />	
</center>           
<cfinclude template="../../footer.cfm">
