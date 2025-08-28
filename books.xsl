<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Library Book Catalog</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <style>
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        margin: 0;
                        padding: 20px;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        min-height: 100vh;
                    }
                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        background: white;
                        border-radius: 15px;
                        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
                        overflow: hidden;
                    }
                    .header {
                        background: linear-gradient(45deg, #2c3e50, #3498db);
                        color: white;
                        padding: 30px;
                        text-align: center;
                    }
                    .header h1 {
                        margin: 0;
                        font-size: 2.5em;
                        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
                    }
                    .books-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
                        gap: 20px;
                        padding: 30px;
                    }
                    .book {
                        border: 1px solid #ddd;
                        border-radius: 12px;
                        padding: 20px;
                        background: linear-gradient(145deg, #f8f9fa, #e9ecef);
                        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }
                    .book:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
                    }
                    .book-title {
                        font-size: 1.3em;
                        font-weight: bold;
                        color: #2c3e50;
                        margin-bottom: 10px;
                        border-bottom: 2px solid #3498db;
                        padding-bottom: 5px;
                    }
                    .book-author {
                        font-size: 1.1em;
                        color: #e74c3c;
                        font-style: italic;
                        margin-bottom: 15px;
                    }
                    .book-info {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 10px;
                        margin-bottom: 15px;
                    }
                    .info-item {
                        background: white;
                        padding: 8px 12px;
                        border-radius: 6px;
                        border-left: 4px solid #3498db;
                    }
                    .info-label {
                        font-weight: bold;
                        color: #34495e;
                        font-size: 0.9em;
                    }
                    .info-value {
                        color: #2c3e50;
                        margin-top: 2px;
                    }
                    .book-description {
                        background: #f8f9fa;
                        padding: 15px;
                        border-radius: 8px;
                        border-left: 4px solid #27ae60;
                        margin-top: 15px;
                        line-height: 1.6;
                        color: #2c3e50;
                    }
                    .price {
                        font-size: 1.2em;
                        font-weight: bold;
                        color: #27ae60;
                    }
                    .rating {
                        color: #f39c12;
                        font-weight: bold;
                    }
                    .availability {
                        padding: 5px 10px;
                        border-radius: 15px;
                        font-size: 0.9em;
                        font-weight: bold;
                        text-align: center;
                    }
                    .in-stock {
                        background: #d4edda;
                        color: #155724;
                    }
                    .limited-stock {
                        background: #fff3cd;
                        color: #856404;
                    }
                    .out-of-stock {
                        background: #f8d7da;
                        color: #721c24;
                    }
                    .stats {
                        background: #34495e;
                        color: white;
                        padding: 20px;
                        text-align: center;
                    }
                    @media (max-width: 768px) {
                        .books-grid {
                            grid-template-columns: 1fr;
                            padding: 15px;
                        }
                        .book-info {
                            grid-template-columns: 1fr;
                        }
                        .header h1 {
                            font-size: 2em;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>📚 Library Book Catalog</h1>
                        <p>Discover amazing books in our collection</p>
                    </div>
                    
                    <div class="stats">
                        <p><strong>Total Books: </strong><xsl:value-of select="count(library/book)"/></p>
                    </div>
                    
                    <div class="books-grid">
                        <xsl:for-each select="library/book">
                            <div class="book">
                                <div class="book-title">
                                    <xsl:value-of select="title"/>
                                </div>
                                <div class="book-author">
                                    by <xsl:value-of select="author"/>
                                </div>
                                
                                <div class="book-info">
                                    <div class="info-item">
                                        <div class="info-label">ISBN</div>
                                        <div class="info-value"><xsl:value-of select="isbn"/></div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Publication Date</div>
                                        <div class="info-value"><xsl:value-of select="publication_date"/></div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Publisher</div>
                                        <div class="info-value"><xsl:value-of select="publisher"/></div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Genre</div>
                                        <div class="info-value"><xsl:value-of select="genre"/></div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Pages</div>
                                        <div class="info-value"><xsl:value-of select="pages"/> pages</div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Language</div>
                                        <div class="info-value"><xsl:value-of select="language"/></div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Price</div>
                                        <div class="info-value price">$<xsl:value-of select="price"/></div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-label">Rating</div>
                                        <div class="info-value rating">⭐ <xsl:value-of select="rating"/>/5</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-label">Availability</div>
                                    <div class="info-value">
                                        <xsl:choose>
                                            <xsl:when test="availability = 'In Stock'">
                                                <span class="availability in-stock"><xsl:value-of select="availability"/></span>
                                            </xsl:when>
                                            <xsl:when test="availability = 'Limited Stock'">
                                                <span class="availability limited-stock"><xsl:value-of select="availability"/></span>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <span class="availability out-of-stock"><xsl:value-of select="availability"/></span>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </div>
                                
                                <div class="book-description">
                                    <strong>Description:</strong><br/>
                                    <xsl:value-of select="description"/>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>