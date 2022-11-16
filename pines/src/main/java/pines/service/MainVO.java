package pines.service;

import java.util.List;

public class MainVO {
	private String userId;
	private String productId;
	private String storeId;
	private String productName;
	private String productPrice;
	private String productDescription;
	private String regYN;
	private String categoryId;
	private String parentCategoryId;
	private String discountPrice;
	private List<String> regStateList;
	private String regState;
	private int productStock;
	private int discountRate;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private int minPurchase;
	private int maxPurchase;
	private int shippingCost;
	private int freeShippingPrice;
	private String regDate;
	private String discountPeriod;	
	private String optionId;
	private String orderOption;
	private int numOfProduct;
	private int totalNum;
	private int discountWon;
	private int totalAmount;
	private String searchGubun;
	private String searchText;
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 10;
	private String orderName;
	private String orderZipCode;
	private String orderAddress;
	private String deliveryStatus;
	private String orderId;
	
	
	public String getParentCategoryId() {
		return parentCategoryId;
	}
	public void setParentCategoryId(String parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderZipCode() {
		return orderZipCode;
	}
	public void setOrderZipCode(String orderZipCode) {
		this.orderZipCode = orderZipCode;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getOrderOption() {
		return orderOption;
	}
	public void setOrderOption(String orderOption) {
		this.orderOption = orderOption;
	}
	public int getNumOfProduct() {
		return numOfProduct;
	}
	public void setNumOfProduct(int numOfProduct) {
		this.numOfProduct = numOfProduct;
	}
	public String getOptionId() {
		return optionId;
	}
	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getDiscountWon() {
		return discountWon;
	}
	public void setDiscountWon(int discountWon) {
		this.discountWon = discountWon;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getRegYN() {
		return regYN;
	}
	public void setRegYN(String regYN) {
		this.regYN = regYN;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(String discountPrice) {
		this.discountPrice = discountPrice;
	}
	public List<String> getRegStateList() {
		return regStateList;
	}
	public void setRegStateList(List<String> regStateList) {
		this.regStateList = regStateList;
	}
	public String getRegState() {
		return regState;
	}
	public void setRegState(String regState) {
		this.regState = regState;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public int getMinPurchase() {
		return minPurchase;
	}
	public void setMinPurchase(int minPurchase) {
		this.minPurchase = minPurchase;
	}
	public int getMaxPurchase() {
		return maxPurchase;
	}
	public void setMaxPurchase(int maxPurchase) {
		this.maxPurchase = maxPurchase;
	}
	public int getShippingCost() {
		return shippingCost;
	}
	public void setShippingCost(int shippingCost) {
		this.shippingCost = shippingCost;
	}
	public int getFreeShippingPrice() {
		return freeShippingPrice;
	}
	public void setFreeShippingPrice(int freeShippingPrice) {
		this.freeShippingPrice = freeShippingPrice;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDiscountPeriod() {
		return discountPeriod;
	}
	public void setDiscountPeriod(String discountPeriod) {
		this.discountPeriod = discountPeriod;
	}
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
}
