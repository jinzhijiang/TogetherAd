public class TogetherAd {

    public static let shared = TogetherAd()
    
    private init() {}

    
    /**
     * 自定义公共的的的广告提供商比例，有序
     */
    private var mRatioPublicMap:[String:Int] = [:]

    /**
     * 保存每个广告位的分发方式
     */
    public var mDispatchTypeMap: [String:DispatchType] = [:]

    /**
     * 所有注册的广告提供商
     */
    public var mProviders: [String: Any] = [:]

    /**
     * 添加广告提供商
     */
    public func addProvider<T: BaseAdProvider>(adProviderEntity: AdProviderEntity<T>) {
        mProviders[adProviderEntity.providerType] = adProviderEntity
        "注册广告提供商：\(adProviderEntity.providerType)".logi()
    }

    internal func getProvider<T: BaseAdProvider>(providerType: String) -> AdProviderEntity<T>? {
        return mProviders[providerType] as? AdProviderEntity<T> ?? nil
    }

    /**
     * 全局配置默认比例
     *
     * ratioMap:
     * val map = LinkedHashLinkedHashMap<String, Int>()
     * map.put(AdProviderType.GDT, 1)
     * map.put(AdProviderType.CSJ, 1)
     * map.put(AdProviderType.BAIDU, 2)
     */
    public func setPublicProviderRatio(ratioMap: [String: Int]) {
        "设置默认广告提供商比例：\(ratioMap)".logi()
        mRatioPublicMap.removeAll()
        for (k, v) in ratioMap {
            mRatioPublicMap[k] = v
        }
    }

    /**
     * 有自定义的就用自定义的，没有自定义就每个注册的广告商等比
     */
    public func getPublicProviderRatio() -> [String: Int] {
        if mRatioPublicMap.isEmpty {
            var defaultMap: [String: Int] = [:]
            for (k, _) in mProviders {
                defaultMap[k] = 0
            }
            return defaultMap
        } else {
            return mRatioPublicMap
        }
    }
//
//    /**
//     * 可自定义图片加载处理
//     */
//    var mImageLoader: AdImageLoader? = DefaultImageLoader()
//        private set

//    /**
//     * 提供了自定义图片加载框架的接口
//     */
//    func setCustomImageLoader(@NotNull imageLoader: AdImageLoader) {
//        mImageLoader = imageLoader
//    }

    /**
     * 是否打印 Log 日志
     */
    public var printLogEnable: Bool = true

    /**
     * 是否失败切换 （ 当请求广告失败时，是否允许切换到其他广告提供商再次请求 ）
     */
    public var failedSwitchEnable: Bool = true

    /**
     * 通用最大拉取延时时间ms（ 请求广告的超时时间；3000 ≤ value ≥ 10000 ）
     */
    public var maxFetchDelay: Int = 0 {
        willSet(newCurrent) {
            if newCurrent < 3000 {
                self.maxFetchDelay = 3000
            } else if newCurrent > 10000 {
                self.maxFetchDelay = 10000
            } else {
                self.maxFetchDelay = newCurrent
            }
        }
    }

    /**
     * 所有广告商所有广告类型的广告都会回调这个监听器
     * 主要是方便做统计：请求成功率、请求失败信息等
     */
    public var allAdListener: AllAdListener? = nil

    /**
     * 分发方式
     * DispatchType.Random 按照权重比例随机分发
     * DispatchType.Priority 按照优先级分发广告
     */
    public var dispatchType: DispatchType = DispatchType.Random
}
