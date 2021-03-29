<cfinclude template="../../header.cfm">
<!--- this page sorts meetings by day --->                       
          
 
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
    WHERE wamodistrict = #district#
    ORDER BY groupcity
</cfquery>
<center>
<cfoutput>
<cfinclude template="meetcodes.cfm">
<table cellpadding="0" cellspacing="0">
<cfform name="getnewstuff" action="meetinglist9.cfm" method="post">
	<tr>
    	<td colspan="1">
        	&nbsp;<br>   	
        </td>
    	<td colspan="5" align="left"><font style="font-size:22px; color:black;">
            If you would like to attend a meeting of Alcoholics Anonymous you are welcome to attend any OPEN meeting.<br />
            Open  meetings  are  available  to  anyone  interested  in Alcoholics Anonymous&acute; program of recovery from alcoholism.<br />
            Nonalcoholics  may  attend  open  meetings as observers.   <a href="meetinglist10.cfm">CLICK HERE For a list of just OPEN meetings.</a><br /><br />
            
            </font>
            <font size="5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Some groups have temporarily closed but are hosting online or conference call meetings<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <font style="font-size:22px; color:blue;"><a href="meetinglist11.cfm">CLICK HERE For a list of only Online and Phone and Relocated meetings.</a></font>
            <br /><br />
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
                style="width:250px; height: 48px; font-size:24px; text-align:center;">
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
                style="width: 250px; height: 48px; font-size:24px; text-align:center;">
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
<cfoutput>
<table border="0" width="90%">
<cfquery name="getarea" datasource="#attributes.dsn#">
		SELECT DISTINCT grouparea
    	FROM groupinfo
    	WHERE wamodistrict = #testdistrict#
        ORDER BY grouparea
</cfquery>
<cfloop query="getarea">
	<tr>
		<td align="center">
	        <font style="font-size:37px; line-height:1.2; letter-spacing:0px;">
	        <cfoutput>#getarea.grouparea#</cfoutput>
	        </font>
	    </td>
	</tr>
    <tr>    
    	<td>
        	<table width="100%">
                <cfquery name="getcity" datasource="#attributes.dsn#">
					SELECT DISTINCT groupcity
    				FROM groupinfo
					WHERE grouparea = '#getarea.grouparea#'
                    	AND wamodistrict = #testdistrict#
                    ORDER BY groupcity
				</cfquery>
				<cfloop query="getcity">
		    	<tr>
        			<td align="center">
                		<font style="font-size:37px;">
                	    <cfoutput>#getcity.groupcity#</cfoutput>
                		</font>
        			</td>
    			</tr>
				<tr>
					<td>
                    	<table width="100%">
                         <cfquery name="getgroup" datasource="#attributes.dsn#">
							SELECT *	
    						FROM groupinfo
							WHERE grouparea = '#getarea.grouparea#'
                            	AND groupcity = '#getcity.groupcity#'
                            	AND wamodistrict = #testdistrict#
                    		ORDER BY groupname
						</cfquery>
                        <cfloop query="getgroup">
                        	<tr>
                            	<td>
									
                                    
<table width="100%" border="0">
	<tr>
		<td nowrap colspan="7" width="100%">
			<b>
			#getgroup.groupname#<br>
			#getgroup.groupaddress#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <cfif suspended eq "yes" OR groupname CONTAINS 'suspended'><font color="red">This location temporarily closed</font><br />
            <cfelse>
            <a href="https://www.google.com/maps/place/#getgroup.groupaddress#,+#getgroup.groupcity#,+#getgroup.groupstate#+#getgroup.groupzip#" target="new">Get Map to Group</a>  <br /></cfif>
			#getgroup.groupcity# #getgroup.groupstate# #getgroup.groupzip#<br>
			# getgroup.grouplocation#<br>
			#getgroup.groupdirections#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #getgroup.groupphone#<br />
            #groupnote1#
            <cfif #getgroup.spanish# is "yes">Spanish<br></cfif> 
            <cfif #getgroup.attended# is "all"><cfelse>#attended#</cfif>
        	</b>
        </td>
    </tr>
    <tr>
    	<td nowrap colspan="3" width="52%">
        	<cfif #getgroup.wheelchair# is "yes">Wheelchair Accessible<br></cfif>
			<cfif #getgroup.hearing# is "yes">Hearing Impaired<br></cfif>
			<cfif #getgroup.childcare# is "yes">Childcare Available<br></cfif>
		</td>
    	<td nowrap colspan="3" width="52%">
        	<cfif #getgroup.handicap# is "yes">Full Handicap Accessibility<br></cfif>
			<cfif #getgroup.nosmoking# is "yes">Smoking Allowed<br></cfif>
			<cfif #getgroup.childfriend# is "yes">Child Friendly Meetings<br></cfif>
		</td>
		<td nowrap colspan="1" align="right">
			
		</td>
	</tr>
<cfset findonline = 0>
<cfquery name="getonline" datasource="#attributes.dsn#">
	SELECT *
	FROM Meetinfo
	WHERE groupid = #getgroup.groupid# AND online = on
</cfquery>
<cfloop query="getonline"><cfset findonline=findonline+1></cfloop>
<cfset findphone = 0>
<cfquery name="getphone" datasource="#attributes.dsn#">
	SELECT *
	FROM Meetinfo
	WHERE groupid = #getgroup.groupid# AND online = off AND conference_phone <> ''
</cfquery>
<cfloop query="getphone"><cfset findphone=findphone+1></cfloop>
<cfquery name="getmeeting" datasource="#attributes.dsn#">
SELECT *
FROM Meetinfo
WHERE groupid = #getgroup.groupid#
ORDER BY day, time1
</cfquery>
	<tr>
    	<td colspan="7">
			<font color="green"><cfif findonline gt 0 OR getgroup.groupname contains 'online'>This Group is<cfif getgroup.suspended neq "yes"> also</cfif> holding Online Meetings<br /></cfif>
			<cfif (findonline eq 0 AND findphone gt 0)>This Group has conference call meetings</cfif></font><br />
        </td>
    </tr>    	
    <tr>
    	<td width="14%" align="center">
        	SUN
        </td>
        <td width="14%" align="center">
        	MON
        </td>
        <td width="14%" align="center">
        	TUE
        </td>
        <td width="14%" align="center">
        	WED
        </td>
        <td width="14%" align="center">
            THU
        </td>
        <td width="14%" align="center">
        	FRI
        </td>
        <td width="14%" align="center">
        	SAT
        </td>
    </tr>
    
<!------- meetings between 6am and 9am ------->    
<cfset mm=0>
  	<cfloop query="getmeeting">
    <cfif online eq "yes"><cfelse>
       	<cfif #getmeeting.time1# gte #night#>
			<cfif #getmeeting.time1# lt #early#>
           		<cfset mm = mm + 1>
        	</cfif>
        </cfif>
    </cfif>
    </cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                 </cfif>
                 </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #night#>
						<cfif #getmeeting.time1# lt #early#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
<!------- meetings between 9am and noon ------->        
<cfset mm=0>
  	<cfloop query="getmeeting">
        <cfif online eq "yes"><cfelse>
       	<cfif #getmeeting.time1# gte #early#>
			<cfif #getmeeting.time1# lt #morning#>
            	<cfset mm = mm + 1>
        	</cfif>
        </cfif>
    </cfif>
    </cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">            
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #early#>
						<cfif #getmeeting.time1# lt #morning#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
<!------- meetings between noon and 1pm ------->        
<cfset mm=0>
    <cfloop query="getmeeting">
    <cfif online eq "yes"><cfelse>
        <cfif #getmeeting.time1# gte #morning#>
			<cfif #getmeeting.time1# lt #noon#>
        		<cfset mm = mm + 1>
        	</cfif>
    	</cfif>
    </cfif>
	</cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                     </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #morning#>
						<cfif #getmeeting.time1# lt #noon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                            <cfif #timeformat(getmeeting.time1," h:mm tt")# eq "12:00 pm">
                            NOON<cfelse>#timeformat(getmeeting.time1," h:mm tt")#</cfif>
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
<!------- meetings between 1pm and 5pm ------->        
<cfset mm=0>
   	<cfloop query="getmeeting">
    <cfif online eq "yes"><cfelse>
       	<cfif #getmeeting.time1# gte #noon#>
			<cfif #getmeeting.time1# lt #afternoon#>
            	<cfset mm = mm + 1>
          	</cfif>
        </cfif>
    </cfif>
	</cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #noon#>
						<cfif #getmeeting.time1# lt #afternoon#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
<!------- meetings between 5pm and 7pm ------->        
<cfset mm=0>
	<cfloop query="getmeeting">
    <cfif online eq "yes"><cfelse>
        <cfif #getmeeting.time1# gte #afternoon#>
			<cfif #getmeeting.time1# lt #dinner#>
               <cfset mm = mm + 1>
            </cfif>
        </cfif>
    </cfif>
    </cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>

							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #afternoon#>
						<cfif #getmeeting.time1# lt #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
    </cfif>
<!------- meetings between 7pm and 10pm ------->        
    <cfset mm=0>
    	<cfloop query="getmeeting">
        <cfif online eq "yes"><cfelse>
        	<cfif #getmeeting.time1# gte #dinner#>
			<cfif #getmeeting.time1# lt #evening#>
               <cfset mm = mm + 1>
            </cfif></cfif>
        </cfif>
        </cfloop>
    <cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #dinner#>
						<cfif #getmeeting.time1# lt #evening#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
            </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #dinner#>
						<cfif #getmeeting.time1# lt #evening#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #dinner#>
						<cfif #getmeeting.time1# lt #evening#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #dinner#>
						<cfif #getmeeting.time1# lt #evening#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #dinner#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
						<cfif #getmeeting.time1# lt #evening#>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #dinner#>
						<cfif #getmeeting.time1# lt #evening#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #dinner#>
						<cfif #getmeeting.time1# lt #evening#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
<!------- meetings between 10pm and midnight ------->    
<cfset mm=0>
	<cfloop query="getmeeting">
    <cfif online eq "yes"><cfelse>
       	<cfif #getmeeting.time1# gte #evening#>
			<cfif #getmeeting.time1# lt #midnight#> 
               <cfset mm = mm + 1>
            </cfif>
        </cfif>
    </cfif>
    </cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>&nbsp;#getmeeting.people#</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #evening#>
						<cfif #getmeeting.time1# lt #midnight#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
<!------- meetings between midnight and 6am ------->        
<cfset mm=0>
	<cfloop query="getmeeting">
    <cfif online eq "yes"><cfelse>
		<cfif #getmeeting.time1# gte #midnight#>
			<cfif #getmeeting.time1# lt #night#>
               <cfset mm = mm + 1>
            </cfif>
        </cfif>
    </cfif>
    </cfloop>
<cfif mm gt 0>    
    <tr>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 1>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 2>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 3>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 4>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 5>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 6>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td>
    	<td align="center" valign="top" nowrap>
        	<cfloop query="getmeeting">
            	<cfif online eq "yes"><cfelse>
        		<cfif #getmeeting.day# is 7>
					<cfif #getmeeting.time1# gte #midnight#>
						<cfif #getmeeting.time1# lt #night#>
							<cfif #getmeeting.topic# eq "none">
								<cfset getmeeting.topic = " ">
							</cfif>
							<cfif #getmeeting.people# eq "All">
								<cfset getmeeting.people = " ">
							</cfif>
                        	#timeformat(getmeeting.time1," h:mm tt")#
							<cfif #getmeeting.open# eq "open">
                            	<i>O&nbsp;</i>
							</cfif>
                            
                            <i>#getmeeting.topic#</i>
							<i>#getmeeting.people#&nbsp;</i>
                        </cfif>
                    </cfif>
                </cfif>
                </cfif>
			</cfloop>
		</td> 
    </tr>
</cfif>
    <tr>
    	<td colspan="7">
        	<hr>
        </td>
    </tr>
</table>


</td>
</tr>
</cfloop>
</table>
</td>
</tr>
</cfloop>
</table>
</td>
</tr>
</cfloop>
</cfoutput>
 </center>          
<cfinclude template="../../footer.cfm">