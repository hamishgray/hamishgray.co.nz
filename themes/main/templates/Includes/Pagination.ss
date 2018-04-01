<%-- NOTE: Before including this, you will need to wrap the include in a with block  --%>

<div class="col-md-12 center">
<hr>
<% if $MoreThanOnePage %>
    <p class="pagination">
        <% if $NotFirstPage %>
            <a class="prev" href="{$PrevLink}">Previous page</a>
        <% end_if %>
    
        <% loop $Pages %>
            <% if $CurrentBool %>
                <span>$PageNum</span>
            <% else %>
                <% if $Link %>
                    <a class="num" href="$Link">$PageNum</a>
                <% else %>
                    <span>...</span>
                <% end_if %>
            <% end_if %>
        <% end_loop %>
            
        <% if $NotLastPage %>
            <a class="next" href="{$NextLink}">Next page</a>
        <% end_if %>
    </p>
<% end_if %>
</div>