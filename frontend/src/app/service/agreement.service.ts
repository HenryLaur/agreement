import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IAgreement } from '../model/agreement.model';

export type EntityResponseType = HttpResponse<IAgreement>;
export type EntityArrayResponseType = HttpResponse<IAgreement[]>;

@Injectable({ providedIn: 'root' })
export class AgreementService {
    protected resourceUrl = 'api/agreements';

    constructor(protected http: HttpClient) {}

    create(agreement: IAgreement): Observable<EntityResponseType> {
        return this.http.post<IAgreement>(this.resourceUrl, agreement, { observe: 'response' });
    }

    update(agreement: IAgreement): Observable<EntityResponseType> {
        return this.http.put<IAgreement>(`${this.resourceUrl}/${agreement.id}`, agreement, { observe: 'response' });
    }

    find(id: number): Observable<EntityResponseType> {
        return this.http.get<IAgreement>(`${this.resourceUrl}/${id}`, { observe: 'response' });
    }

    findAll(): Observable<EntityArrayResponseType> {
        return this.http.get<IAgreement[]>(this.resourceUrl, { observe: 'response' });
    }

    delete(id: number): Observable<HttpResponse<{}>> {
        return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
    }
}
