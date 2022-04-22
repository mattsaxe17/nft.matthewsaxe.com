export { default as MButton } from '../../components/MButton.vue'
export { default as MContainer } from '../../components/MContainer.vue'
export { default as MFooter } from '../../components/MFooter.vue'
export { default as MLink } from '../../components/MLink.vue'
export { default as MarketplaceBody } from '../../components/MarketplaceBody.vue'
export { default as MarketplaceHeader } from '../../components/MarketplaceHeader.vue'
export { default as NavMenu } from '../../components/NavMenu.vue'
export { default as NftCard } from '../../components/NftCard.vue'
export { default as Watermark } from '../../components/Watermark.vue'

// nuxt/nuxt.js#8607
function wrapFunctional(options) {
  if (!options || !options.functional) {
    return options
  }

  const propKeys = Array.isArray(options.props) ? options.props : Object.keys(options.props || {})

  return {
    render(h) {
      const attrs = {}
      const props = {}

      for (const key in this.$attrs) {
        if (propKeys.includes(key)) {
          props[key] = this.$attrs[key]
        } else {
          attrs[key] = this.$attrs[key]
        }
      }

      return h(options, {
        on: this.$listeners,
        attrs,
        props,
        scopedSlots: this.$scopedSlots,
      }, this.$slots.default)
    }
  }
}
