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
public class QuotationDetailsBean implements Serializable {

    public String articleDesc;
    public String articleId;
    public String articlePrice;
    public String articleCurrency;
    public String articleQty;
    public String articleAmount;
    public String article_desc;
    public String article_spc;
    public String articleSpec;

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
    public String getArticlePrice() {
        return articlePrice;
    }

    /**
     * @param price the price to set
     */
    public void setArticlePrice(String articlePrice) {
        this.articlePrice = articlePrice;
    }

    /**
     * @return the currency
     */
    public String getArticleCurrency() {
        return articleCurrency;
    }

    /**
     * @param currency the currency to set
     */
    public void setArticleCurrency(String articleCurrency) {
        this.articleCurrency = articleCurrency;
    }

    /**
     * @return the articleQty
     */
    public String getArticleQty() {
        return articleQty;
    }

    /**
     * @param articleQty the articleQty to set
     */
    public void setArticleQty(String articleQty) {
        this.articleQty = articleQty;
    }

    /**
     * @return the articleAmount
     */
    public String getArticleAmount() {
        return articleAmount;
    }

    /**
     * @param articleAmount the articleAmount to set
     */
    public void setArticleAmount(String articleAmount) {
        this.articleAmount = articleAmount;
    }

    /**
     * @return the article_desc
     */
    public String getArticle_desc() {
        return article_desc;
    }

    /**
     * @param article_desc the article_desc to set
     */
    public void setArticle_desc(String article_desc) {
        this.article_desc = article_desc;
    }

    /**
     * @return the article_spc
     */
    public String getArticle_spc() {
        return article_spc;
    }

    /**
     * @param article_spc the article_spc to set
     */
    public void setArticle_spc(String article_spc) {
        this.article_spc = article_spc;
    }

    /**
     * @return the articleSpec
     */
    public String getArticleSpec() {
        return articleSpec;
    }

    /**
     * @param articleSpec the articleSpec to set
     */
    public void setArticleSpec(String articleSpec) {
        this.articleSpec = articleSpec;
    }
}
