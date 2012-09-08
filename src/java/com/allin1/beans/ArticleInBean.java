/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.allin1.beans;

import java.io.Serializable;

/**
 *
 * @author Anshujkumar
 */
public class ArticleInBean implements Serializable{
    public String articleDesc;
    public String articleId;
    public String price;
    public String currency;
    public String articleTechSpec;
    public String articleTechDesc;
    public String article_Spec;
    public String articleOptionItem;
    public String articleOptionDesc;
    public String articleOptionPrice;
    public String articleOptionCurr;
    /**
     * @return the articleDesc
     */
    public String getArticleDesc() {
        return articleDesc;
    }

    /**
     * @param articleDesc the articleDesc to set
     */
    public void setArticleDesc(String articleDesc) {
        this.articleDesc = articleDesc;
    }

    /**
     * @return the articleId
     */
    public String getArticleId() {
        return articleId;
    }

    /**
     * @param articleId the articleId to set
     */
    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    /**
     * @return the price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * @return the currency
     */
    public String getCurrency() {
        return currency;
    }

    /**
     * @param currency the currency to set
     */
    public void setCurrency(String currency) {
        this.currency = currency;
    }

    /**
     * @return the articleTechSpec
     */
    public String getArticleTechSpec() {
        return articleTechSpec;
    }

    /**
     * @param articleTechSpec the articleTechSpec to set
     */
    public void setArticleTechSpec(String articleTechSpec) {
        this.articleTechSpec = articleTechSpec;
    }

    /**
     * @return the articleTechDesc
     */
    public String getArticleTechDesc() {
        return articleTechDesc;
    }

    /**
     * @param articleTechDesc the articleTechDesc to set
     */
    public void setArticleTechDesc(String articleTechDesc) {
        this.articleTechDesc = articleTechDesc;
    }

    /**
     * @return the article_Spec
     */
    public String getArticle_Spec() {
        return article_Spec;
    }

    /**
     * @param article_Spec the article_Spec to set
     */
    public void setArticle_Spec(String article_Spec) {
        this.article_Spec = article_Spec;
    }

    /**
     * @return the articleOptionItem
     */
    public String getArticleOptionItem() {
        return articleOptionItem;
    }

    /**
     * @param articleOptionItem the articleOptionItem to set
     */
    public void setArticleOptionItem(String articleOptionItem) {
        this.articleOptionItem = articleOptionItem;
    }

    /**
     * @return the articleOptionDesc
     */
    public String getArticleOptionDesc() {
        return articleOptionDesc;
    }

    /**
     * @param articleOptionDesc the articleOptionDesc to set
     */
    public void setArticleOptionDesc(String articleOptionDesc) {
        this.articleOptionDesc = articleOptionDesc;
    }

    /**
     * @return the articleOptionPrice
     */
    public String getArticleOptionPrice() {
        return articleOptionPrice;
    }

    /**
     * @param articleOptionPrice the articleOptionPrice to set
     */
    public void setArticleOptionPrice(String articleOptionPrice) {
        this.articleOptionPrice = articleOptionPrice;
    }

    /**
     * @return the articleOptionCurr
     */
    public String getArticleOptionCurr() {
        return articleOptionCurr;
    }

    /**
     * @param articleOptionCurr the articleOptionCurr to set
     */
    public void setArticleOptionCurr(String articleOptionCurr) {
        this.articleOptionCurr = articleOptionCurr;
    }
}
