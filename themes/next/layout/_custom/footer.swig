<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.authoricon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>&nbsp;&nbsp;&nbsp;&nbsp;

  {% if theme.copyright %}
  <div class="powered-by">
    {{ __('footer.powered', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}
  </div>

  <div class="powered-by">
    {{ __('footer.theme') }} -
    <a class="theme-link" target="_blank" href="https://github.com/iissnan/hexo-theme-next">
      NexT.{{ theme.scheme }}
    </a>
  </div>
  {% endif %}
</div>




